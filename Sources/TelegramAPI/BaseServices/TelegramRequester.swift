//
//  TelegramRequester.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

internal class TelegramRequester
{
    
    private let log: RequestLoger? = RequestLoger()
    private let session: URLSession
    private let url: URL
    
    internal init(url: URL, session: URLSession = URLSession(configuration: .default))
    {
        self.url = url
        self.session = session
    }
    
    internal func request<InType: Encodable, OutType: Decodable>(_ method: String, 
                                                                 object: InType, 
                                                                 numberOfAttempts: Int,
                                                                 timeoutInterval: TimeInterval,
                                                                 completion: @escaping (TelegramResult<OutType>) -> Void)
    {
        let data = try? JSONEncoder().encode(object)
        let request = self.makeRequest(method, data: data, timeoutInterval: timeoutInterval)
        self.log?.info(head: "REQUEST", request: request, data: data, error: nil)
        run(numberOfAttempts: numberOfAttempts, request: request, completion: completion)
    }
    
    internal func request<InType: IMultiPartFromDataEncodable, OutType: Decodable>
        (_ method: String, 
         object: InType, 
         numberOfAttempts: Int,
         timeoutInterval: TimeInterval,
         completion: @escaping (TelegramResult<OutType>) -> Void)
    {
        let encoder = MultiPartFromDataEncoder()
        try? object.encode(encoder)
        let values = encoder.allValues
        let boundary = UUID().uuidString.replacingOccurrences(of: " ", with: "")
        let data = MultiPartFromDataBuilder.multipartData(values: values, boundary: boundary)
        let dataInfo = MultiPartFromDataBuilder.multipartData(values: values, boundary: boundary, log: true)
        let contentType = "Content-Type: multipart/form-data; boundary=\(boundary)"
        let request = self.makeRequest(method, data: data, timeoutInterval: timeoutInterval, contentType: contentType)
        self.log?.info(head: "REQUEST", request: request, data: dataInfo, error: nil)
        run(numberOfAttempts: numberOfAttempts, request: request, completion: completion)
    }

    private func run<OutType: Decodable>(
        numberOfAttempts: Int,
        request: URLRequest,
        completion: @escaping (TelegramResult<OutType>) -> Void
    ) {
        print("TRY \(numberOfAttempts)")
        let task = self.session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            self?.log?.info(head: "RESPONS", request: request, data: data, error: error)
            if numberOfAttempts > 1, error != nil {
                self?.run(
                    numberOfAttempts: numberOfAttempts - 1,
                    request: request,
                    completion: completion
                )
                return
            }
            self?.completionTask(data: data,
                                 response: response,
                                 error: error,
                                 completion: completion)
        })
        task.resume()
    }

    private func completionTask<OutType: Decodable>(data: Data?,
                                                    response: URLResponse?,
                                                    error: Error?,
                                                    completion: @escaping (TelegramResult<OutType>) -> Void)
    {
        if let data = data
        {
            do 
            {
                let result = try JSONDecoder().decode(TelegramRespons<OutType>.self,
                                                      from: data)
                completion(.completion(object: result))
            }
            catch let error
            {
                self.log?.warning("ERROR PARCE: \(TelegramRespons<OutType>.self)")
                completion(.parseError(error: error))
            }
            return
        }
        
        if let error = error
        {
            completion(.transportError(error: error))
            return
        }
        
        completion(.parseError(error: nil))
    }
    
    private func makeRequest(_ method: String, 
                             data: Data?, 
                             timeoutInterval: TimeInterval,
                             contentType: String = "application/json") -> URLRequest
    {
        
        let url = self.url.appendingPathComponent(method)
        var reqest = URLRequest(url: url, timeoutInterval: timeoutInterval)
        reqest.allHTTPHeaderFields = ["Content-Type": contentType]
        reqest.httpBody = data
        reqest.httpMethod = "POST"
        return reqest
    }
}

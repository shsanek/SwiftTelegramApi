//
//  TelegramRequester.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//

import Foundation

internal class TelegramRequester
{
    
    private let session: URLSession
    private let url: URL
    
    internal init(url: URL, session: URLSession = URLSession(configuration: .default))
    {
        self.url = url
        self.session = session
    }
    
    internal func request<InType: Encodable, OutType: Decodable>(_ method: String, 
                                                                 object: InType, 
                                                                 completion: @escaping (TelegramResult<OutType>) -> Void)
    {
        let data = try? JSONEncoder().encode(object)
        let request = self.makeRequest(method, data: data)
        let info = self.infoForRequest(request: request, data: data, error: nil)
        
        print("-----------REQUEST----------- \n\(info)\n-----------END-------------")
        let task = self.session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            self?.completionTask(request: request, 
                                 data: data, 
                                 response: response, 
                                 error: error, 
                                 completion: completion)
        })
        task.resume()
    }
    
    private func completionTask<OutType: Decodable>(request: URLRequest,
                                                    data: Data?,
                                                    response: URLResponse?,
                                                    error: Error?,
                                                    completion: @escaping (TelegramResult<OutType>) -> Void)
    {
        let info = self.infoForRequest(request: request, data: data, error: error)
        print("-----------RESPONS----------- \n\(info)\n-----------END-------------")
        if let data = data
        {
            do 
            {
                let result = try JSONDecoder().decode(TelegramRespons<OutType>.self, from: data)
                completion(.completion(object: result))
            }
            catch let error
            {
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
    
    private func infoForRequest(request: URLRequest, data: Data?, error: Error?) -> String
    {
        let url = request.url?.absoluteString ?? "nil"
        let dataText = data.flatMap({ String(data: $0, encoding: .utf8) }) ?? "nil"
        let heads = request.allHTTPHeaderFields?.map({ "\($0.key): \($0.value)" }).joined(separator: ",\n\t") ?? ""
        return "url: \(url)\nhead: [\(heads)]\ndata: \(dataText)\nerror: \(String(describing: error))"
    }
    
    private func makeRequest(_ method: String, data: Data?) -> URLRequest
    {
        
        let url = self.url.appendingPathComponent(method)
        var reqest = URLRequest(url: url)
        reqest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        reqest.httpBody = data
        reqest.httpMethod = "POST"
        return reqest
    }
    
}



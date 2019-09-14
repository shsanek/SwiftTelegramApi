//
//  RequestLoger.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation

internal class RequestLoger
{
    
    internal func info(head: String, request: URLRequest, data: Data?, error: Error?)
    {
        let info = self.infoForRequest(request: request, data: data, error: error)
        print("-----------\(head)----------- \n\(info)\n-----------END-------------")
    }
    
    internal func warning(_ text: String)
    {
        print("\(text)")
    }
    
    private func infoForRequest(request: URLRequest, data: Data?, error: Error?) -> String
    {
        let url = request.url?.absoluteString ?? "nil"
        let dataText = data.flatMap({ String(data: $0, encoding: .utf8) }) ?? "nil"
        let heads = request.allHTTPHeaderFields?.map({ "\($0.key): \($0.value)" }).joined(separator: ",\n\t") ?? ""
        return "url: \(url)\nhead: [\(heads)]\ndata: \(dataText)\nerror: \(String(describing: error))"
    }
    
}

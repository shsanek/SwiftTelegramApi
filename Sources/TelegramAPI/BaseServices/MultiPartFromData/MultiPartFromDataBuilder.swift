//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation

internal class MultiPartFromDataBuilder
{
    
    internal static func multipartData(values: [String: MultiPartFromDataContainer], boundary: String, log: Bool = false) 
        -> Data
    {
        let nextLine = "\r\n"
        var sendData = Data()
        for value in values
        {
            let parameters = ([value.value.type, "name=\"\(value.key)\";"] + value.value.parameters.map({"\($0.key)=\"\($0.value)\""})).joined(separator: "; ")
            sendData.append("--" + boundary + nextLine)
            sendData.append(parameters + nextLine)
            if let type = value.value.contentType
            {
                sendData.append("Content-Type: " + type + nextLine)
            }
            sendData.append(nextLine)
            let data = value.value.data()
            if log && data.count > 20
            {
                sendData.append(data.prefix(20))
                sendData.append("...")
            }
            else
            {
                sendData.append(value.value.data())
            }
            sendData.append(nextLine)
        }
        sendData.append("--" + boundary + "--" + nextLine)
        return sendData
    }
    
}

extension Data
{
    
    @discardableResult
    fileprivate mutating func append(_ string: String) -> Data
    {
        let data = string.data(using: .utf8)!
        self.append(data)
        return self
    }
    
}


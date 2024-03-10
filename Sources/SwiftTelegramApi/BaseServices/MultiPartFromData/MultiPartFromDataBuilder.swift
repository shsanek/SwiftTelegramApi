//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

internal class MultiPartFromDataBuilder
{
    
    internal static func multipartData(values: [String: MultiPartFromDataContainer], boundary: String, log: Bool = false) 
        -> Data
    {
        let nextLine = "\r\n"
        var sendData = Data()
        var attaches: [MultiPartFromDataContainer] = []
        for value in values
        {
            add(key: value.key, value: value.value, sendData: &sendData, boundary: boundary, log: log, nextLine: nextLine)
            attaches.append(contentsOf: value.value.attach)
        }
        for attach in attaches {
            if let key = attach.absoluteName {
                add(key: key, value: attach, sendData: &sendData, boundary: boundary, log: log, nextLine: nextLine)
            }
        }
        sendData.append("--" + boundary + "--" + nextLine)
        return sendData
    }

    private static func add(
        key: String,
        value: MultiPartFromDataContainer,
        sendData: inout Data,
        boundary: String,
        log: Bool,
        nextLine: String
    ) {
        let key = value.absoluteName ?? key
        let parameters = [value.type + "; ", "name=\"\(key)\"; "] + [(value.parameters.map({"\($0.key)=\"\($0.value)\""})).joined(separator: "; ")]
        sendData.append("--" + boundary + nextLine)
        sendData.append(parameters.joined() + nextLine)
        if let type = value.contentType
        {
            sendData.append("Content-Type: " + type + nextLine)
        }
        sendData.append(nextLine)
        let data = value.data()
        if log && data.count > 20
        {
//            sendData.append(data.prefix(20))
//            sendData.append("...")
            sendData.append(value.data())
        }
        else
        {
            sendData.append(value.data())
        }
        sendData.append(nextLine)
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


//
//  MultiPartFromDataEncoder.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif

internal class MultiPartFromDataEncoder
{
    
    internal var allValues: [String: MultiPartFromDataContainer] {
        var result = [String: MultiPartFromDataContainer]()
        for container in self.values
        {
            let subkeys = container.key.dropFirst()
            let subkey = subkeys.map({"[\($0)]"}).joined()
            let key = String(container.key[0]) + String(subkey)
            result[key] = container.value
        }
        return result
    }

    private var values: [[String]: MultiPartFromDataContainer] = [:]
    
    internal func append(_ key: String, object: IMultiPartFromDataEncodable?)
    {
        guard let object = object else
        {
            return
        }
        let coder = MultiPartFromDataEncoder()
        object.encode(coder)
        for container in coder.values
        {
            self.values[[key] + container.key] = container.value
        }
    }
    
    internal func append(_ key: String, object: IMultiPartFromDataValueEncodable?)
    {
        guard let object = object else
        {
            return
        }
        self.values[[key]] = object.multipartFromDataValue
    }
    
}

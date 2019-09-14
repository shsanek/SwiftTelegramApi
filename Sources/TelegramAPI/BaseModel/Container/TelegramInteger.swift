//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public typealias TelegramInteger = UInt64

extension UInt64: IMultiPartFromDataValueEncodable
{
    
    internal var multipartFromDataValue: MultiPartFromDataContainer {
        return MultiPartFromDataContainer("\(self)")
    }
    
}

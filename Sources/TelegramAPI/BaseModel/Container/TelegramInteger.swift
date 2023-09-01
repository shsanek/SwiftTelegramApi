//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public typealias TelegramInteger = Int64

extension Int64: IMultiPartFromDataValueEncodable
{
    
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        return MultiPartFromDataContainer("\(self)")
    }
    
}

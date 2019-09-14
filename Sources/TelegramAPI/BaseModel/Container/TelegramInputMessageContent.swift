//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramInputMessageContent: Codable
{
}

extension TelegramInputMessageContent: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }
    
}

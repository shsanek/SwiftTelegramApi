//
//  TelegramInlineQueryResult.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramInlineQueryResult: Codable
{
}

extension TelegramInlineQueryResult: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }
    
}

//
//  TelegramCallbackGame.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramCallbackGame: Codable
{
}

extension TelegramCallbackGame: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }
    
}

//
//  TelegramPassportElementError.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramPassportElementError: Codable
{
}

extension TelegramPassportElementError: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }
    
}

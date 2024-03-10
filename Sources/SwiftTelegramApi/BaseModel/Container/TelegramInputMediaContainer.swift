//
//  TelegramInputMediaContainer.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramInputMediaContainer: Codable
{
}

extension TelegramInputMediaContainer: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }
    
}

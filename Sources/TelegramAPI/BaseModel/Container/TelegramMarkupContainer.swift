//
//  TelegramMarkupContainer.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramMarkupContainer: Codable
{
    
}


extension TelegramMarkupContainer: IMultiPartFromDataEncodable
{

    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }

}

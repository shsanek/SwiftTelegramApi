//
//  File.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public struct TelegramInputMedia: Codable
{
	public init() { }
}

extension TelegramInputMedia: IMultiPartFromDataEncodable
{
    
    internal func encode(_ encoder: MultiPartFromDataEncoder) 
    {
        fatalError()
    }
    
}

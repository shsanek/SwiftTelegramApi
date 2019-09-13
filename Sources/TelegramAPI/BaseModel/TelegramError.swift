//
//  File.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//

public struct TelegramError
{
    
    public let errorCode: Int
    public let description: String
    
    internal init(errorCode: Int, description: String)
    {
        self.errorCode = errorCode
        self.description = description
    }
    
}

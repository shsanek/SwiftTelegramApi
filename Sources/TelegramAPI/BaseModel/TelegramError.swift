//
//  File.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//

import Foundation

public struct TelegramError: Error
{
    
    public let errorCode: Int
    public let description: String
    
    internal init(errorCode: Int, description: String)
    {
        self.errorCode = errorCode
        self.description = description
    }
    
}

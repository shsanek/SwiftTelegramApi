//
//  File.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//

public enum TelegramResult<Type: Decodable>
{
    
    case completion(object: TelegramRespons<Type>)
    case transportError(error: Error)
    case parseError(error: Error?)
    
}

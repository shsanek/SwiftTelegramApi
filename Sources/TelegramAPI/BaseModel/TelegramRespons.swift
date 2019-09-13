//
//  File.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//


public struct TelegramRespons<ResultType: Decodable>: Decodable
{

    public let ok: Bool
    public let result: ResultType?
    public var error: TelegramError? {
        if self.ok == false,
            let errorCode = self.error_code, 
            let description = self.description
        {
            return TelegramError(errorCode: errorCode, 
                                 description: description)
        }
        return nil
    }
    
    internal let error_code: Int?
    internal let description: String?

}

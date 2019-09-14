//
//  TelegramAPI.swift
//  
//
//  Created by Alex Shipin on 11.08.2019.
//

import Foundation

public final class TelegramAPI
{
    
    private static let api: String = "https://api.telegram.org"

    internal let requester: TelegramRequester

    public init(token: String)
    {
        guard let url = URL(string: TelegramAPI.api) else
        {
            fatalError()
        }
        let fullURL = url.appendingPathComponent(token)
        let requester = TelegramRequester(url: fullURL)
        self.requester = requester
    }
    
}

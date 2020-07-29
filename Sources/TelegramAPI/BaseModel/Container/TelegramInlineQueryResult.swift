//
//  TelegramInlineQueryResult.swift
//  
//
//  Created by Alex Shipin on 14.09.2019.
//

public protocol TelegramInlineQueryResult: Encodable
{
}

public struct TelegramInlineQueryResultContainer: Encodable
{

    public let encodeHandler: (_ encoder: Encoder) throws -> Void

    public init<Content: TelegramInlineQueryResult>(content: TelegramInlineQueryResult)
    {
        self.encodeHandler = content.encode
    }

    public func encode(to encoder: Encoder) throws
    {
        try self.encodeHandler(encoder)
    }

}


//
//  TelegramInlineQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.
public struct TelegramInlineQuery
{

	///Unique identifier for this query
	public let id: String

	///Sender
	public let from: TelegramUser

	///Optional. Sender location, only for bots that request user location
	public let location: TelegramLocation?

	///Text of the query (up to 512 characters)
	public let query: String

	///Offset of the results to be returned, can be controlled by the bot
	public let offset: String

	public init(id: String,
                from: TelegramUser,
                location: TelegramLocation? = nil,
                query: String,
                offset: String)
	{
		self.id = id
		self.from = from
		self.location = location
		self.query = query
		self.offset = offset
	}

}

extension TelegramInlineQuery: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case from
		case location
		case query
		case offset
	}

}
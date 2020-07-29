//
//  TelegramInlineQueryResultGame.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a Game.
public struct TelegramInlineQueryResultGame: TelegramInlineQueryResult
{

	///Type of the result, must be game
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///Short name of the game
	public let gameShortName: String

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(type: String,
                id: String,
                gameShortName: String,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.type = type
		self.id = id
		self.gameShortName = gameShortName
		self.replyMarkup = replyMarkup
	}

}

extension TelegramInlineQueryResultGame: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case gameShortName = "game_short_name"
		case replyMarkup = "reply_markup"
	}

}

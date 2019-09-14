//
//  TelegramCallbackQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.
public struct TelegramCallbackQuery
{

	///Unique identifier for this query
	public let id: String

	///Sender
	public let from: TelegramUser

	///Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
	public let message: TelegramMessage?

	///Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
	public let inlineMessageId: String?

	///Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
	public let chatInstance: String

	///Optional. Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.
	public let data: String?

	///Optional. Short name of a Game to be returned, serves as the unique identifier for the game
	public let gameShortName: String?

	public init(id: String,
                from: TelegramUser,
                message: TelegramMessage? = nil,
                inlineMessageId: String? = nil,
                chatInstance: String,
                data: String? = nil,
                gameShortName: String? = nil)
	{
		self.id = id
		self.from = from
		self.message = message
		self.inlineMessageId = inlineMessageId
		self.chatInstance = chatInstance
		self.data = data
		self.gameShortName = gameShortName
	}

}

extension TelegramCallbackQuery: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case from
		case message
		case inlineMessageId = "inline_message_id"
		case chatInstance = "chat_instance"
		case data
		case gameShortName = "game_short_name"
	}

}

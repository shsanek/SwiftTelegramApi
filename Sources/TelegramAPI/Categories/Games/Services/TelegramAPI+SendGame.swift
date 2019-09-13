//
//  TelegramAPI+SendGame.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send a game. On success, the sent Message is returned.
	public func sendGame(_ input: TelegramSendGameInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendGame", object: input, completion: completionHandler)
	}

}


public struct TelegramSendGameInput
{

	///Unique identifier for the target chat
	public let chatId: TelegramInteger

	///Short name of the game, serves as the unique identifier for the game. Set up your games via Botfather.
	public let gameShortName: String

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///A JSON-serialized object for an inline keyboard. If empty, one ‘Play game_title’ button will be shown. If not empty, the first button must launch the game.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramInteger,
                gameShortName: String,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.gameShortName = gameShortName
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendGameInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case gameShortName = "game_short_name"
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

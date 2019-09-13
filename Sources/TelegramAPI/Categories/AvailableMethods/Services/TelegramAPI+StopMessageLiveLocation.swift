//
//  TelegramAPI+StopMessageLiveLocation.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to stop updating a live location message before live_period expires. On success, if the message was sent by the bot, the sent Message is returned, otherwise True is returned.
	public func stopMessageLiveLocation(_ input: TelegramStopMessageLiveLocationInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("stopMessageLiveLocation", object: input, completion: completionHandler)
	}

}


public struct TelegramStopMessageLiveLocationInput
{

	///Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?

	///Required if inline_message_id is not specified. Identifier of the message with live location to stop
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	///A JSON-serialized object for a new inline keyboard.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramIdentifierContainer? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramStopMessageLiveLocationInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
		case replyMarkup = "reply_markup"
	}

}

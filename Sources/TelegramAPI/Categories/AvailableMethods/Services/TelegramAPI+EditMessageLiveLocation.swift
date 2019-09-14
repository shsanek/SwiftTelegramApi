//
//  TelegramAPI+EditMessageLiveLocation.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message was sent by the bot, the edited Message is returned, otherwise True is returned.
	public func editMessageLiveLocation(_ input: TelegramEditMessageLiveLocationInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("editMessageLiveLocation", object: input, completion: completionHandler)
	}

}


public struct TelegramEditMessageLiveLocationInput
{

	///Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?

	///Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	///Latitude of new location
	public let latitude: TelegramFloat

	///Longitude of new location
	public let longitude: TelegramFloat

	///A JSON-serialized object for a new inline keyboard.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramIdentifierContainer? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil,
                latitude: TelegramFloat,
                longitude: TelegramFloat,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.latitude = latitude
		self.longitude = longitude
		self.replyMarkup = replyMarkup
	}

}

extension TelegramEditMessageLiveLocationInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
		case latitude
		case longitude
		case replyMarkup = "reply_markup"
	}

}


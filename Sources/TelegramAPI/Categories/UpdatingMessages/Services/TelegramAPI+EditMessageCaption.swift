//
//  TelegramAPI+EditMessageCaption.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to edit captions of messages. On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	public func editMessageCaption(_ input: TelegramEditMessageCaptionInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("editMessageCaption", object: input, completion: completionHandler)
	}

}


public struct TelegramEditMessageCaptionInput
{

	///Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?

	///Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	///New caption of the message
	public let caption: String?

	///Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///A JSON-serialized object for an inline keyboard.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramIdentifierContainer? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
	}

}

extension TelegramEditMessageCaptionInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
	}

}


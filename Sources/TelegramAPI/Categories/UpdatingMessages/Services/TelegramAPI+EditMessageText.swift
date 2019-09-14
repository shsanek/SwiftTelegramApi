//
//  TelegramAPI+EditMessageText.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to edit text and game messages. On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	public func editMessageText(_ input: TelegramEditMessageTextInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("editMessageText", object: input, completion: completionHandler)
	}

}


public struct TelegramEditMessageTextInput
{

	///Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?

	///Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	///New text of the message
	public let text: String

	///Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot&#39;s message.
	public let parseMode: String?

	///Disables link previews for links in this message
	public let disableWebPagePreview: Bool?

	///A JSON-serialized object for an inline keyboard.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramIdentifierContainer? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil,
                text: String,
                parseMode: String? = nil,
                disableWebPagePreview: Bool? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.text = text
		self.parseMode = parseMode
		self.disableWebPagePreview = disableWebPagePreview
		self.replyMarkup = replyMarkup
	}

}

extension TelegramEditMessageTextInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
		case text
		case parseMode = "parse_mode"
		case disableWebPagePreview = "disable_web_page_preview"
		case replyMarkup = "reply_markup"
	}

}


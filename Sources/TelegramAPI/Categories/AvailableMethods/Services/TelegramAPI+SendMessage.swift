//
//  TelegramAPI+SendMessage.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to send text messages. On success, the sent Message is returned.
	public func sendMessage(_ input: TelegramSendMessageInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendMessage", object: input, completion: completionHandler)
	}

}


public struct TelegramSendMessageInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Text of the message to be sent
	public let text: String

	///Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot&#39;s message.
	public let parseMode: String?

	///Disables link previews for links in this message
	public let disableWebPagePreview: Bool?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                text: String,
                parseMode: String? = nil,
                disableWebPagePreview: Bool? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.text = text
		self.parseMode = parseMode
		self.disableWebPagePreview = disableWebPagePreview
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendMessageInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case text
		case parseMode = "parse_mode"
		case disableWebPagePreview = "disable_web_page_preview"
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

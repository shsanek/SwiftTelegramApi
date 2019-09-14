//
//  TelegramInputTextMessageContent.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents the content of a text message to be sent as the result of an inline query.
public struct TelegramInputTextMessageContent
{

	///Text of the message to be sent, 1-4096 characters
	public let messageText: String

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot&#39;s message.
	public let parseMode: String?

	///Optional. Disables link previews for links in the sent message
	public let disableWebPagePreview: Bool?

	public init(messageText: String,
                parseMode: String? = nil,
                disableWebPagePreview: Bool? = nil)
	{
		self.messageText = messageText
		self.parseMode = parseMode
		self.disableWebPagePreview = disableWebPagePreview
	}

}

extension TelegramInputTextMessageContent: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case messageText = "message_text"
		case parseMode = "parse_mode"
		case disableWebPagePreview = "disable_web_page_preview"
	}

}

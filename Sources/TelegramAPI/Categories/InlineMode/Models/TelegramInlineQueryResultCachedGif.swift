//
//  TelegramInlineQueryResultCachedGif.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation.
public struct TelegramInlineQueryResultCachedGif
{

	///Type of the result, must be gif
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid file identifier for the GIF file
	public let gifFileId: String

	///Optional. Title for the result
	public let title: String?

	///Optional. Caption of the GIF file to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the GIF animation
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                gifFileId: String,
                title: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.gifFileId = gifFileId
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultCachedGif: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case gifFileId = "gif_file_id"
		case title
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}
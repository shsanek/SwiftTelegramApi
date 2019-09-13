//
//  TelegramInlineQueryResultGif.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
public struct TelegramInlineQueryResultGif
{

	///Type of the result, must be gif
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid URL for the GIF file. File size must not exceed 1MB
	public let gifUrl: String

	///Optional. Width of the GIF
	public let gifWidth: TelegramInteger?

	///Optional. Height of the GIF
	public let gifHeight: TelegramInteger?

	///Optional. Duration of the GIF
	public let gifDuration: TelegramInteger?

	///URL of the static thumbnail for the result (jpeg or gif)
	public let thumbUrl: String

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
                gifUrl: String,
                gifWidth: TelegramInteger? = nil,
                gifHeight: TelegramInteger? = nil,
                gifDuration: TelegramInteger? = nil,
                thumbUrl: String,
                title: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.gifUrl = gifUrl
		self.gifWidth = gifWidth
		self.gifHeight = gifHeight
		self.gifDuration = gifDuration
		self.thumbUrl = thumbUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultGif: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case gifUrl = "gif_url"
		case gifWidth = "gif_width"
		case gifHeight = "gif_height"
		case gifDuration = "gif_duration"
		case thumbUrl = "thumb_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}
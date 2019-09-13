//
//  TelegramInlineQueryResultMpeg4Gif.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
public struct TelegramInlineQueryResultMpeg4Gif
{

	///Type of the result, must be mpeg4_gif
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid URL for the MP4 file. File size must not exceed 1MB
	public let mpeg4Url: String

	///Optional. Video width
	public let mpeg4Width: TelegramInteger?

	///Optional. Video height
	public let mpeg4Height: TelegramInteger?

	///Optional. Video duration
	public let mpeg4Duration: TelegramInteger?

	///URL of the static thumbnail (jpeg or gif) for the result
	public let thumbUrl: String

	///Optional. Title for the result
	public let title: String?

	///Optional. Caption of the MPEG-4 file to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the video animation
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                mpeg4Url: String,
                mpeg4Width: TelegramInteger? = nil,
                mpeg4Height: TelegramInteger? = nil,
                mpeg4Duration: TelegramInteger? = nil,
                thumbUrl: String,
                title: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.mpeg4Url = mpeg4Url
		self.mpeg4Width = mpeg4Width
		self.mpeg4Height = mpeg4Height
		self.mpeg4Duration = mpeg4Duration
		self.thumbUrl = thumbUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultMpeg4Gif: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case mpeg4Url = "mpeg4_url"
		case mpeg4Width = "mpeg4_width"
		case mpeg4Height = "mpeg4_height"
		case mpeg4Duration = "mpeg4_duration"
		case thumbUrl = "thumb_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}
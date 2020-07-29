//
//  TelegramInlineQueryResultCachedMpeg4Gif.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
public struct TelegramInlineQueryResultCachedMpeg4Gif: TelegramInlineQueryResult
{

	///Type of the result, must be mpeg4_gif
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid file identifier for the MP4 file
	public let mpeg4FileId: String

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
                mpeg4FileId: String,
                title: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.mpeg4FileId = mpeg4FileId
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultCachedMpeg4Gif: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case mpeg4FileId = "mpeg4_file_id"
		case title
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}

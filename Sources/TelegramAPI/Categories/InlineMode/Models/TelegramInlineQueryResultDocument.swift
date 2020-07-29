//
//  TelegramInlineQueryResultDocument.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.
public struct TelegramInlineQueryResultDocument: TelegramInlineQueryResult
{

	///Type of the result, must be document
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///Title for the result
	public let title: String

	///Optional. Caption of the document to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///A valid URL for the file
	public let documentUrl: String

	///Mime type of the content of the file, either “application/pdf” or “application/zip”
	public let mimeType: String

	///Optional. Short description of the result
	public let description: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the file
	public let inputMessageContent: TelegramInputMessageContent?

	///Optional. URL of the thumbnail (jpeg only) for the file
	public let thumbUrl: String?

	///Optional. Thumbnail width
	public let thumbWidth: TelegramInteger?

	///Optional. Thumbnail height
	public let thumbHeight: TelegramInteger?

	public init(type: String,
                id: String,
                title: String,
                caption: String? = nil,
                parseMode: String? = nil,
                documentUrl: String,
                mimeType: String,
                description: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil,
                thumbUrl: String? = nil,
                thumbWidth: TelegramInteger? = nil,
                thumbHeight: TelegramInteger? = nil)
	{
		self.type = type
		self.id = id
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.documentUrl = documentUrl
		self.mimeType = mimeType
		self.description = description
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbUrl = thumbUrl
		self.thumbWidth = thumbWidth
		self.thumbHeight = thumbHeight
	}

}

extension TelegramInlineQueryResultDocument: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case title
		case caption
		case parseMode = "parse_mode"
		case documentUrl = "document_url"
		case mimeType = "mime_type"
		case description
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
		case thumbUrl = "thumb_url"
		case thumbWidth = "thumb_width"
		case thumbHeight = "thumb_height"
	}

}

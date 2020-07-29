//
//  TelegramInlineQueryResultCachedDocument.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file.
public struct TelegramInlineQueryResultCachedDocument: TelegramInlineQueryResult
{

	///Type of the result, must be document
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///Title for the result
	public let title: String

	///A valid file identifier for the file
	public let documentFileId: String

	///Optional. Short description of the result
	public let description: String?

	///Optional. Caption of the document to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the file
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                title: String,
                documentFileId: String,
                description: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.title = title
		self.documentFileId = documentFileId
		self.description = description
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultCachedDocument: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case title
		case documentFileId = "document_file_id"
		case description
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}

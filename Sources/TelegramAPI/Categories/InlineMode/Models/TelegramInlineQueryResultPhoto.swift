//
//  TelegramInlineQueryResultPhoto.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
public struct TelegramInlineQueryResultPhoto: TelegramInlineQueryResult
{

	///Type of the result, must be photo
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid URL of the photo. Photo must be in jpeg format. Photo size must not exceed 5MB
	public let photoUrl: String

	///URL of the thumbnail for the photo
	public let thumbUrl: String

	///Optional. Width of the photo
	public let photoWidth: TelegramInteger?

	///Optional. Height of the photo
	public let photoHeight: TelegramInteger?

	///Optional. Title for the result
	public let title: String?

	///Optional. Short description of the result
	public let description: String?

	///Optional. Caption of the photo to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the photo
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                photoUrl: String,
                thumbUrl: String,
                photoWidth: TelegramInteger? = nil,
                photoHeight: TelegramInteger? = nil,
                title: String? = nil,
                description: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.photoUrl = photoUrl
		self.thumbUrl = thumbUrl
		self.photoWidth = photoWidth
		self.photoHeight = photoHeight
		self.title = title
		self.description = description
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultPhoto: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case photoUrl = "photo_url"
		case thumbUrl = "thumb_url"
		case photoWidth = "photo_width"
		case photoHeight = "photo_height"
		case title
		case description
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}

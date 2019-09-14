//
//  TelegramInlineQueryResultLocation.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.
public struct TelegramInlineQueryResultLocation
{

	///Type of the result, must be location
	public let type: String

	///Unique identifier for this result, 1-64 Bytes
	public let id: String

	///Location latitude in degrees
	public let latitude: TelegramFloat

	///Location longitude in degrees
	public let longitude: TelegramFloat

	///Location title
	public let title: String

	///Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	public let livePeriod: TelegramInteger?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the location
	public let inputMessageContent: TelegramInputMessageContent?

	///Optional. Url of the thumbnail for the result
	public let thumbUrl: String?

	///Optional. Thumbnail width
	public let thumbWidth: TelegramInteger?

	///Optional. Thumbnail height
	public let thumbHeight: TelegramInteger?

	public init(type: String,
                id: String,
                latitude: TelegramFloat,
                longitude: TelegramFloat,
                title: String,
                livePeriod: TelegramInteger? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil,
                thumbUrl: String? = nil,
                thumbWidth: TelegramInteger? = nil,
                thumbHeight: TelegramInteger? = nil)
	{
		self.type = type
		self.id = id
		self.latitude = latitude
		self.longitude = longitude
		self.title = title
		self.livePeriod = livePeriod
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbUrl = thumbUrl
		self.thumbWidth = thumbWidth
		self.thumbHeight = thumbHeight
	}

}

extension TelegramInlineQueryResultLocation: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case latitude
		case longitude
		case title
		case livePeriod = "live_period"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
		case thumbUrl = "thumb_url"
		case thumbWidth = "thumb_width"
		case thumbHeight = "thumb_height"
	}

}

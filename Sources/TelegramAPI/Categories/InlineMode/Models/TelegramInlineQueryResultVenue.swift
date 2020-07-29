//
//  TelegramInlineQueryResultVenue.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.
public struct TelegramInlineQueryResultVenue: TelegramInlineQueryResult
{

	///Type of the result, must be venue
	public let type: String

	///Unique identifier for this result, 1-64 Bytes
	public let id: String

	///Latitude of the venue location in degrees
	public let latitude: TelegramFloat

	///Longitude of the venue location in degrees
	public let longitude: TelegramFloat

	///Title of the venue
	public let title: String

	///Address of the venue
	public let address: String

	///Optional. Foursquare identifier of the venue if known
	public let foursquareId: String?

	///Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
	public let foursquareType: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the venue
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
                address: String,
                foursquareId: String? = nil,
                foursquareType: String? = nil,
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
		self.address = address
		self.foursquareId = foursquareId
		self.foursquareType = foursquareType
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbUrl = thumbUrl
		self.thumbWidth = thumbWidth
		self.thumbHeight = thumbHeight
	}

}

extension TelegramInlineQueryResultVenue: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case latitude
		case longitude
		case title
		case address
		case foursquareId = "foursquare_id"
		case foursquareType = "foursquare_type"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
		case thumbUrl = "thumb_url"
		case thumbWidth = "thumb_width"
		case thumbHeight = "thumb_height"
	}

}

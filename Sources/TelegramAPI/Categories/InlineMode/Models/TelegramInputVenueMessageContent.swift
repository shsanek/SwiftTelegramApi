//
//  TelegramInputVenueMessageContent.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents the content of a venue message to be sent as the result of an inline query.
public struct TelegramInputVenueMessageContent
{

	///Latitude of the venue in degrees
	public let latitude: TelegramFloat

	///Longitude of the venue in degrees
	public let longitude: TelegramFloat

	///Name of the venue
	public let title: String

	///Address of the venue
	public let address: String

	///Optional. Foursquare identifier of the venue, if known
	public let foursquareId: String?

	///Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
	public let foursquareType: String?

	public init(latitude: TelegramFloat,
                longitude: TelegramFloat,
                title: String,
                address: String,
                foursquareId: String? = nil,
                foursquareType: String? = nil)
	{
		self.latitude = latitude
		self.longitude = longitude
		self.title = title
		self.address = address
		self.foursquareId = foursquareId
		self.foursquareType = foursquareType
	}

}

extension TelegramInputVenueMessageContent: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case latitude
		case longitude
		case title
		case address
		case foursquareId = "foursquare_id"
		case foursquareType = "foursquare_type"
	}

}
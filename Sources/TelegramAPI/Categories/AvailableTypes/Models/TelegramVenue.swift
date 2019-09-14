//
//  TelegramVenue.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a venue.
public struct TelegramVenue
{

	///Venue location
	public let location: TelegramLocation

	///Name of the venue
	public let title: String

	///Address of the venue
	public let address: String

	///Optional. Foursquare identifier of the venue
	public let foursquareId: String?

	///Optional. Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
	public let foursquareType: String?

	public init(location: TelegramLocation,
                title: String,
                address: String,
                foursquareId: String? = nil,
                foursquareType: String? = nil)
	{
		self.location = location
		self.title = title
		self.address = address
		self.foursquareId = foursquareId
		self.foursquareType = foursquareType
	}

}

extension TelegramVenue: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case location
		case title
		case address
		case foursquareId = "foursquare_id"
		case foursquareType = "foursquare_type"
	}

}

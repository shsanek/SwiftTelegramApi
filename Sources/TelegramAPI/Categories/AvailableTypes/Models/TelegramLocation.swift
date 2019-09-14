//
//  TelegramLocation.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a point on the map.
public struct TelegramLocation
{

	///Longitude as defined by sender
	public let longitude: TelegramFloat

	///Latitude as defined by sender
	public let latitude: TelegramFloat

	public init(longitude: TelegramFloat,
                latitude: TelegramFloat)
	{
		self.longitude = longitude
		self.latitude = latitude
	}

}

extension TelegramLocation: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case longitude
		case latitude
	}

}

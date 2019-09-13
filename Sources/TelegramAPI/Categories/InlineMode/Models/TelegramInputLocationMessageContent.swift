//
//  TelegramInputLocationMessageContent.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents the content of a location message to be sent as the result of an inline query.
public struct TelegramInputLocationMessageContent
{

	///Latitude of the location in degrees
	public let latitude: TelegramFloat

	///Longitude of the location in degrees
	public let longitude: TelegramFloat

	///Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	public let livePeriod: TelegramInteger?

	public init(latitude: TelegramFloat,
                longitude: TelegramFloat,
                livePeriod: TelegramInteger? = nil)
	{
		self.latitude = latitude
		self.longitude = longitude
		self.livePeriod = livePeriod
	}

}

extension TelegramInputLocationMessageContent: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case latitude
		case longitude
		case livePeriod = "live_period"
	}

}
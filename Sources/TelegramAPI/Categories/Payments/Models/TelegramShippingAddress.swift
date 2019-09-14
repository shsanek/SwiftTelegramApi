//
//  TelegramShippingAddress.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a shipping address.
public struct TelegramShippingAddress
{

	///ISO 3166-1 alpha-2 country code
	public let countryCode: String

	///State, if applicable
	public let state: String

	///City
	public let city: String

	///First line for the address
	public let streetLine1: String

	///Second line for the address
	public let streetLine2: String

	///Address post code
	public let postCode: String

	public init(countryCode: String,
                state: String,
                city: String,
                streetLine1: String,
                streetLine2: String,
                postCode: String)
	{
		self.countryCode = countryCode
		self.state = state
		self.city = city
		self.streetLine1 = streetLine1
		self.streetLine2 = streetLine2
		self.postCode = postCode
	}

}

extension TelegramShippingAddress: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case countryCode = "country_code"
		case state
		case city
		case streetLine1 = "street_line1"
		case streetLine2 = "street_line2"
		case postCode = "post_code"
	}

}

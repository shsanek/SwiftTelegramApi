//
//  TelegramOrderInfo.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents information about an order.
public struct TelegramOrderInfo
{

	///Optional. User name
	public let name: String?

	///Optional. User&#39;s phone number
	public let phoneNumber: String?

	///Optional. User email
	public let email: String?

	///Optional. User shipping address
	public let shippingAddress: TelegramShippingAddress?

	public init(name: String? = nil,
                phoneNumber: String? = nil,
                email: String? = nil,
                shippingAddress: TelegramShippingAddress? = nil)
	{
		self.name = name
		self.phoneNumber = phoneNumber
		self.email = email
		self.shippingAddress = shippingAddress
	}

}

extension TelegramOrderInfo: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case name
		case phoneNumber = "phone_number"
		case email
		case shippingAddress = "shipping_address"
	}

}

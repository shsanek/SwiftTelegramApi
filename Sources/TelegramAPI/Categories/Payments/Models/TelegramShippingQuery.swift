//
//  TelegramShippingQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains information about an incoming shipping query.
public struct TelegramShippingQuery
{

	///Unique query identifier
	public let id: String

	///User who sent the query
	public let from: TelegramUser

	///Bot specified invoice payload
	public let invoicePayload: String

	///User specified shipping address
	public let shippingAddress: TelegramShippingAddress

	public init(id: String,
                from: TelegramUser,
                invoicePayload: String,
                shippingAddress: TelegramShippingAddress)
	{
		self.id = id
		self.from = from
		self.invoicePayload = invoicePayload
		self.shippingAddress = shippingAddress
	}

}

extension TelegramShippingQuery: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case from
		case invoicePayload = "invoice_payload"
		case shippingAddress = "shipping_address"
	}

}
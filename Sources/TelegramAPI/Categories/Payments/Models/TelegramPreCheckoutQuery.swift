//
//  TelegramPreCheckoutQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains information about an incoming pre-checkout query.
public struct TelegramPreCheckoutQuery
{

	///Unique query identifier
	public let id: String

	///User who sent the query
	public let from: TelegramUser

	///Three-letter ISO 4217 currency code
	public let currency: String

	///Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	public let totalAmount: TelegramInteger

	///Bot specified invoice payload
	public let invoicePayload: String

	///Optional. Identifier of the shipping option chosen by the user
	public let shippingOptionId: String?

	///Optional. Order info provided by the user
	public let orderInfo: TelegramOrderInfo?

	public init(id: String,
                from: TelegramUser,
                currency: String,
                totalAmount: TelegramInteger,
                invoicePayload: String,
                shippingOptionId: String? = nil,
                orderInfo: TelegramOrderInfo? = nil)
	{
		self.id = id
		self.from = from
		self.currency = currency
		self.totalAmount = totalAmount
		self.invoicePayload = invoicePayload
		self.shippingOptionId = shippingOptionId
		self.orderInfo = orderInfo
	}

}

extension TelegramPreCheckoutQuery: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case from
		case currency
		case totalAmount = "total_amount"
		case invoicePayload = "invoice_payload"
		case shippingOptionId = "shipping_option_id"
		case orderInfo = "order_info"
	}

}
//
//  TelegramSuccessfulPayment.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains basic information about a successful payment.
public struct TelegramSuccessfulPayment
{

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

	///Telegram payment identifier
	public let telegramPaymentChargeId: String

	///Provider payment identifier
	public let providerPaymentChargeId: String

	public init(currency: String,
                totalAmount: TelegramInteger,
                invoicePayload: String,
                shippingOptionId: String? = nil,
                orderInfo: TelegramOrderInfo? = nil,
                telegramPaymentChargeId: String,
                providerPaymentChargeId: String)
	{
		self.currency = currency
		self.totalAmount = totalAmount
		self.invoicePayload = invoicePayload
		self.shippingOptionId = shippingOptionId
		self.orderInfo = orderInfo
		self.telegramPaymentChargeId = telegramPaymentChargeId
		self.providerPaymentChargeId = providerPaymentChargeId
	}

}

extension TelegramSuccessfulPayment: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case currency
		case totalAmount = "total_amount"
		case invoicePayload = "invoice_payload"
		case shippingOptionId = "shipping_option_id"
		case orderInfo = "order_info"
		case telegramPaymentChargeId = "telegram_payment_charge_id"
		case providerPaymentChargeId = "provider_payment_charge_id"
	}

}

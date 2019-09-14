//
//  TelegramInvoice.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains basic information about an invoice.
public struct TelegramInvoice
{

	///Product name
	public let title: String

	///Product description
	public let description: String

	///Unique bot deep-linking parameter that can be used to generate this invoice
	public let startParameter: String

	///Three-letter ISO 4217 currency code
	public let currency: String

	///Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	public let totalAmount: TelegramInteger

	public init(title: String,
                description: String,
                startParameter: String,
                currency: String,
                totalAmount: TelegramInteger)
	{
		self.title = title
		self.description = description
		self.startParameter = startParameter
		self.currency = currency
		self.totalAmount = totalAmount
	}

}

extension TelegramInvoice: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case title
		case description
		case startParameter = "start_parameter"
		case currency
		case totalAmount = "total_amount"
	}

}

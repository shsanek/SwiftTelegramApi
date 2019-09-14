//
//  TelegramLabeledPrice.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a portion of the price for goods or services.
public struct TelegramLabeledPrice
{

	///Portion label
	public let label: String

	///Price of the product in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	public let amount: TelegramInteger

	public init(label: String,
                amount: TelegramInteger)
	{
		self.label = label
		self.amount = amount
	}

}

extension TelegramLabeledPrice: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case label
		case amount
	}

}

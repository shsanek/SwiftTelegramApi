//
//  TelegramShippingOption.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents one shipping option.
public struct TelegramShippingOption
{

	///Shipping option identifier
	public let id: String

	///Option title
	public let title: String

	///List of price portions
	public let prices: [TelegramLabeledPrice]

	public init(id: String,
                title: String,
                prices: [TelegramLabeledPrice])
	{
		self.id = id
		self.title = title
		self.prices = prices
	}

}

extension TelegramShippingOption: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case title
		case prices
	}

}

//
//  TelegramPassportElementErrorUnspecified.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue in an unspecified place. The error is considered resolved when new data is added.
public struct TelegramPassportElementErrorUnspecified
{

	///Error source, must be unspecified
	public let source: String

	///Type of element of the user&#39;s Telegram Passport which has the issue
	public let type: String

	///Base64-encoded element hash
	public let elementHash: String

	///Error message
	public let message: String

	public init(source: String,
                type: String,
                elementHash: String,
                message: String)
	{
		self.source = source
		self.type = type
		self.elementHash = elementHash
		self.message = message
	}

}

extension TelegramPassportElementErrorUnspecified: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case elementHash = "element_hash"
		case message
	}

}

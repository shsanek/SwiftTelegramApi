//
//  TelegramPassportElementErrorDataField.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field&#39;s value changes.
public struct TelegramPassportElementErrorDataField
{

	///Error source, must be data
	public let source: String

	///The section of the user&#39;s Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”
	public let type: String

	///Name of the data field which has the error
	public let fieldName: String

	///Base64-encoded data hash
	public let dataHash: String

	///Error message
	public let message: String

	public init(source: String,
                type: String,
                fieldName: String,
                dataHash: String,
                message: String)
	{
		self.source = source
		self.type = type
		self.fieldName = fieldName
		self.dataHash = dataHash
		self.message = message
	}

}

extension TelegramPassportElementErrorDataField: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fieldName = "field_name"
		case dataHash = "data_hash"
		case message
	}

}

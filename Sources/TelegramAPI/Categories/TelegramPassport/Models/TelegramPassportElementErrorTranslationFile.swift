//
//  TelegramPassportElementErrorTranslationFile.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes.
public struct TelegramPassportElementErrorTranslationFile
{

	///Error source, must be translation_file
	public let source: String

	///Type of element of the user&#39;s Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
	public let type: String

	///Base64-encoded file hash
	public let fileHash: String

	///Error message
	public let message: String

	public init(source: String,
                type: String,
                fileHash: String,
                message: String)
	{
		self.source = source
		self.type = type
		self.fileHash = fileHash
		self.message = message
	}

}

extension TelegramPassportElementErrorTranslationFile: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fileHash = "file_hash"
		case message
	}

}

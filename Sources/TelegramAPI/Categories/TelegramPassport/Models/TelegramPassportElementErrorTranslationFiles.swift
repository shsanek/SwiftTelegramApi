//
//  TelegramPassportElementErrorTranslationFiles.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.
public struct TelegramPassportElementErrorTranslationFiles
{

	///Error source, must be translation_files
	public let source: String

	///Type of element of the user&#39;s Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
	public let type: String

	///List of base64-encoded file hashes
	public let fileHashes: [String]

	///Error message
	public let message: String

	public init(source: String,
                type: String,
                fileHashes: [String],
                message: String)
	{
		self.source = source
		self.type = type
		self.fileHashes = fileHashes
		self.message = message
	}

}

extension TelegramPassportElementErrorTranslationFiles: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fileHashes = "file_hashes"
		case message
	}

}

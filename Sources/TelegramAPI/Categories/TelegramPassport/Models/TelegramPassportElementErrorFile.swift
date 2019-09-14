//
//  TelegramPassportElementErrorFile.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes.
public struct TelegramPassportElementErrorFile
{

	///Error source, must be file
	public let source: String

	///The section of the user&#39;s Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
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

extension TelegramPassportElementErrorFile: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fileHash = "file_hash"
		case message
	}

}

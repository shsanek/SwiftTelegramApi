//
//  TelegramPassportElementErrorFiles.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.
public struct TelegramPassportElementErrorFiles
{

	///Error source, must be files
	public let source: String

	///The section of the user&#39;s Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
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

extension TelegramPassportElementErrorFiles: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fileHashes = "file_hashes"
		case message
	}

}
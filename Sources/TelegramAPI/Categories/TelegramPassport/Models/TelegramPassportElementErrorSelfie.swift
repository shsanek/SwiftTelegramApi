//
//  TelegramPassportElementErrorSelfie.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.
public struct TelegramPassportElementErrorSelfie
{

	///Error source, must be selfie
	public let source: String

	///The section of the user&#39;s Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”
	public let type: String

	///Base64-encoded hash of the file with the selfie
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

extension TelegramPassportElementErrorSelfie: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fileHash = "file_hash"
		case message
	}

}

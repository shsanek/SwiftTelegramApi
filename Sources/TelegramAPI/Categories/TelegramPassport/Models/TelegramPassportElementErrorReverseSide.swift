//
//  TelegramPassportElementErrorReverseSide.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes.
public struct TelegramPassportElementErrorReverseSide
{

	///Error source, must be reverse_side
	public let source: String

	///The section of the user&#39;s Telegram Passport which has the issue, one of “driver_license”, “identity_card”
	public let type: String

	///Base64-encoded hash of the file with the reverse side of the document
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

extension TelegramPassportElementErrorReverseSide: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case source
		case type
		case fileHash = "file_hash"
		case message
	}

}

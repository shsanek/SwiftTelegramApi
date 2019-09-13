//
//  TelegramPassportFile.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don&#39;t exceed 10MB.
public struct TelegramPassportFile
{

	///Identifier for this file
	public let fileId: String

	///File size
	public let fileSize: TelegramInteger

	///Unix time when the file was uploaded
	public let fileDate: TelegramInteger

	public init(fileId: String,
                fileSize: TelegramInteger,
                fileDate: TelegramInteger)
	{
		self.fileId = fileId
		self.fileSize = fileSize
		self.fileDate = fileDate
	}

}

extension TelegramPassportFile: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case fileSize = "file_size"
		case fileDate = "file_date"
	}

}
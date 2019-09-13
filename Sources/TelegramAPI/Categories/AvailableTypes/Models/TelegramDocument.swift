//
//  TelegramDocument.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a general file (as opposed to photos, voice messages and audio files).
public struct TelegramDocument
{

	///Identifier for this file
	public let fileId: String

	///Optional. Document thumbnail as defined by sender
	public let thumb: TelegramPhotoSize?

	///Optional. Original filename as defined by sender
	public let fileName: String?

	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                thumb: TelegramPhotoSize? = nil,
                fileName: String? = nil,
                mimeType: String? = nil,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.thumb = thumb
		self.fileName = fileName
		self.mimeType = mimeType
		self.fileSize = fileSize
	}

}

extension TelegramDocument: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case thumb
		case fileName = "file_name"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}
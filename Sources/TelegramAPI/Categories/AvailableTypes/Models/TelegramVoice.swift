//
//  TelegramVoice.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a voice note.
public struct TelegramVoice
{

	///Identifier for this file
	public let fileId: String

	///Duration of the audio in seconds as defined by sender
	public let duration: TelegramInteger

	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                duration: TelegramInteger,
                mimeType: String? = nil,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.duration = duration
		self.mimeType = mimeType
		self.fileSize = fileSize
	}

}

extension TelegramVoice: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case duration
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}

//
//  TelegramAudio.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents an audio file to be treated as music by the Telegram clients.
public struct TelegramAudio
{

	///Identifier for this file
	public let fileId: String

	///Duration of the audio in seconds as defined by sender
	public let duration: TelegramInteger

	///Optional. Performer of the audio as defined by sender or by audio tags
	public let performer: String?

	///Optional. Title of the audio as defined by sender or by audio tags
	public let title: String?

	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?

	///Optional. File size
	public let fileSize: TelegramInteger?

	///Optional. Thumbnail of the album cover to which the music file belongs
	public let thumb: TelegramPhotoSize?

	public init(fileId: String,
                duration: TelegramInteger,
                performer: String? = nil,
                title: String? = nil,
                mimeType: String? = nil,
                fileSize: TelegramInteger? = nil,
                thumb: TelegramPhotoSize? = nil)
	{
		self.fileId = fileId
		self.duration = duration
		self.performer = performer
		self.title = title
		self.mimeType = mimeType
		self.fileSize = fileSize
		self.thumb = thumb
	}

}

extension TelegramAudio: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case duration
		case performer
		case title
		case mimeType = "mime_type"
		case fileSize = "file_size"
		case thumb
	}

}

//
//  TelegramVideoNote.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a video message (available in Telegram apps as of v.4.0).
public struct TelegramVideoNote
{

	///Identifier for this file
	public let fileId: String

	///Video width and height (diameter of the video message) as defined by sender
	public let length: TelegramInteger

	///Duration of the video in seconds as defined by sender
	public let duration: TelegramInteger

	///Optional. Video thumbnail
	public let thumb: TelegramPhotoSize?

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                length: TelegramInteger,
                duration: TelegramInteger,
                thumb: TelegramPhotoSize? = nil,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.length = length
		self.duration = duration
		self.thumb = thumb
		self.fileSize = fileSize
	}

}

extension TelegramVideoNote: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case length
		case duration
		case thumb
		case fileSize = "file_size"
	}

}

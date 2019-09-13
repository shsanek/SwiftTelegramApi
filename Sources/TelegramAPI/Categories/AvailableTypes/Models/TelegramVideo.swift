//
//  TelegramVideo.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a video file.
public struct TelegramVideo
{

	///Identifier for this file
	public let fileId: String

	///Video width as defined by sender
	public let width: TelegramInteger

	///Video height as defined by sender
	public let height: TelegramInteger

	///Duration of the video in seconds as defined by sender
	public let duration: TelegramInteger

	///Optional. Video thumbnail
	public let thumb: TelegramPhotoSize?

	///Optional. Mime type of a file as defined by sender
	public let mimeType: String?

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                width: TelegramInteger,
                height: TelegramInteger,
                duration: TelegramInteger,
                thumb: TelegramPhotoSize? = nil,
                mimeType: String? = nil,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.width = width
		self.height = height
		self.duration = duration
		self.thumb = thumb
		self.mimeType = mimeType
		self.fileSize = fileSize
	}

}

extension TelegramVideo: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case width
		case height
		case duration
		case thumb
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}
//
//  TelegramAnimation.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound).
public struct TelegramAnimation
{

	///Identifier for this file
	public let fileId: String

	///Video width as defined by sender
	public let width: TelegramInteger

	///Video height as defined by sender
	public let height: TelegramInteger

	///Duration of the video in seconds as defined by sender
	public let duration: TelegramInteger

	///Optional. Animation thumbnail as defined by sender
	public let thumb: TelegramPhotoSize?

	///Optional. Original animation filename as defined by sender
	public let fileName: String?

	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                width: TelegramInteger,
                height: TelegramInteger,
                duration: TelegramInteger,
                thumb: TelegramPhotoSize? = nil,
                fileName: String? = nil,
                mimeType: String? = nil,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.width = width
		self.height = height
		self.duration = duration
		self.thumb = thumb
		self.fileName = fileName
		self.mimeType = mimeType
		self.fileSize = fileSize
	}

}

extension TelegramAnimation: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case width
		case height
		case duration
		case thumb
		case fileName = "file_name"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

}
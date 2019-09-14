//
//  TelegramPhotoSize.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents one size of a photo or a file / sticker thumbnail.
public struct TelegramPhotoSize
{

	///Identifier for this file
	public let fileId: String

	///Photo width
	public let width: TelegramInteger

	///Photo height
	public let height: TelegramInteger

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                width: TelegramInteger,
                height: TelegramInteger,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.width = width
		self.height = height
		self.fileSize = fileSize
	}

}

extension TelegramPhotoSize: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case width
		case height
		case fileSize = "file_size"
	}

}

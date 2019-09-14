//
//  TelegramSticker.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a sticker.
public struct TelegramSticker
{

	///Identifier for this file
	public let fileId: String

	///Sticker width
	public let width: TelegramInteger

	///Sticker height
	public let height: TelegramInteger

	///True, if the sticker is animated
	public let isAnimated: Bool

	///Optional. Sticker thumbnail in the .webp or .jpg format
	public let thumb: TelegramPhotoSize?

	///Optional. Emoji associated with the sticker
	public let emoji: String?

	///Optional. Name of the sticker set to which the sticker belongs
	public let setName: String?

	///Optional. For mask stickers, the position where the mask should be placed
	public let maskPosition: TelegramMaskPosition?

	///Optional. File size
	public let fileSize: TelegramInteger?

	public init(fileId: String,
                width: TelegramInteger,
                height: TelegramInteger,
                isAnimated: Bool,
                thumb: TelegramPhotoSize? = nil,
                emoji: String? = nil,
                setName: String? = nil,
                maskPosition: TelegramMaskPosition? = nil,
                fileSize: TelegramInteger? = nil)
	{
		self.fileId = fileId
		self.width = width
		self.height = height
		self.isAnimated = isAnimated
		self.thumb = thumb
		self.emoji = emoji
		self.setName = setName
		self.maskPosition = maskPosition
		self.fileSize = fileSize
	}

}

extension TelegramSticker: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case width
		case height
		case isAnimated = "is_animated"
		case thumb
		case emoji
		case setName = "set_name"
		case maskPosition = "mask_position"
		case fileSize = "file_size"
	}

}

//
//  TelegramStickerSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a sticker set.
public struct TelegramStickerSet
{

	///Sticker set name
	public let name: String

	///Sticker set title
	public let title: String

	///True, if the sticker set contains animated stickers
	public let isAnimated: Bool

	///True, if the sticker set contains masks
	public let containsMasks: Bool

	///List of all set stickers
	public let stickers: [TelegramSticker]

	public init(name: String,
                title: String,
                isAnimated: Bool,
                containsMasks: Bool,
                stickers: [TelegramSticker])
	{
		self.name = name
		self.title = title
		self.isAnimated = isAnimated
		self.containsMasks = containsMasks
		self.stickers = stickers
	}

}

extension TelegramStickerSet: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case name
		case title
		case isAnimated = "is_animated"
		case containsMasks = "contains_masks"
		case stickers
	}

}

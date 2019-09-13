//
//  TelegramAPI+GetStickerSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to get a sticker set. On success, a StickerSet object is returned.
	public func getStickerSet(_ input: TelegramGetStickerSetInput, completionHandler: @escaping (TelegramResult<TelegramStickerSet>) -> Void)
	{
		self.requester.request("getStickerSet", object: input, completion: completionHandler)
	}

}


public struct TelegramGetStickerSetInput
{

	///Name of the sticker set
	public let name: String

	public init(name: String)
	{
		self.name = name
	}

}

extension TelegramGetStickerSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case name
	}

}

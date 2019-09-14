//
//  TelegramAPI+DeleteStickerFromSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to delete a sticker from a set created by the bot. Returns True on success.
	public func deleteStickerFromSet(_ input: TelegramDeleteStickerFromSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("deleteStickerFromSet", object: input, completion: completionHandler)
	}

}


public struct TelegramDeleteStickerFromSetInput
{

	///File identifier of the sticker
	public let sticker: String

	public init(sticker: String)
	{
		self.sticker = sticker
	}

}

extension TelegramDeleteStickerFromSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case sticker
	}

}


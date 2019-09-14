//
//  TelegramAPI+SetStickerPositionInSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to move a sticker in a set created by the bot to a specific position . Returns True on success.
	public func setStickerPositionInSet(_ input: TelegramSetStickerPositionInSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setStickerPositionInSet", object: input, completion: completionHandler)
	}

}


public struct TelegramSetStickerPositionInSetInput
{

	///File identifier of the sticker
	public let sticker: String

	///New sticker position in the set, zero-based
	public let position: TelegramInteger

	public init(sticker: String,
                position: TelegramInteger)
	{
		self.sticker = sticker
		self.position = position
	}

}

extension TelegramSetStickerPositionInSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case sticker
		case position
	}

}


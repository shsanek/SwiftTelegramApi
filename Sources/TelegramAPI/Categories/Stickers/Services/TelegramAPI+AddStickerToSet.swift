//
//  TelegramAPI+AddStickerToSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to add a new sticker to a set created by the bot. Returns True on success.
	public func addStickerToSet(_ input: TelegramAddStickerToSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("addStickerToSet", object: input, completion: completionHandler)
	}

}


public struct TelegramAddStickerToSetInput
{

	///User identifier of sticker set owner
	public let userId: TelegramInteger

	///Sticker set name
	public let name: String

	///Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	public let pngSticker: TelegramInputFileContainer

	///One or more emoji corresponding to the sticker
	public let emojis: String

	///A JSON-serialized object for position where the mask should be placed on faces
	public let maskPosition: TelegramMaskPosition?

	public init(userId: TelegramInteger,
                name: String,
                pngSticker: TelegramInputFileContainer,
                emojis: String,
                maskPosition: TelegramMaskPosition? = nil)
	{
		self.userId = userId
		self.name = name
		self.pngSticker = pngSticker
		self.emojis = emojis
		self.maskPosition = maskPosition
	}

}

extension TelegramAddStickerToSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case name
		case pngSticker = "png_sticker"
		case emojis
		case maskPosition = "mask_position"
	}

}

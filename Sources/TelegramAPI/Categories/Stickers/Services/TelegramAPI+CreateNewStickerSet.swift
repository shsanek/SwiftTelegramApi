//
//  TelegramAPI+CreateNewStickerSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to create new sticker set owned by a user. The bot will be able to edit the created sticker set. Returns True on success.
	public func createNewStickerSet(_ input: TelegramCreateNewStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("createNewStickerSet", object: input, completion: completionHandler)
	}

}


public struct TelegramCreateNewStickerSetInput
{

	///User identifier of created sticker set owner
	public let userId: TelegramInteger

	///Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only english letters, digits and underscores. Must begin with a letter, can&#39;t contain consecutive underscores and must end in “_by_&lt;bot username&gt;”. &lt;bot_username&gt; is case insensitive. 1-64 characters.
	public let name: String

	///Sticker set title, 1-64 characters
	public let title: String

	///Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	public let pngSticker: TelegramInputFileContainer

	///One or more emoji corresponding to the sticker
	public let emojis: String

	///Pass True, if a set of mask stickers should be created
	public let containsMasks: Bool?

	///A JSON-serialized object for position where the mask should be placed on faces
	public let maskPosition: TelegramMaskPosition?

	public init(userId: TelegramInteger,
                name: String,
                title: String,
                pngSticker: TelegramInputFileContainer,
                emojis: String,
                containsMasks: Bool? = nil,
                maskPosition: TelegramMaskPosition? = nil)
	{
		self.userId = userId
		self.name = name
		self.title = title
		self.pngSticker = pngSticker
		self.emojis = emojis
		self.containsMasks = containsMasks
		self.maskPosition = maskPosition
	}

}

extension TelegramCreateNewStickerSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case name
		case title
		case pngSticker = "png_sticker"
		case emojis
		case containsMasks = "contains_masks"
		case maskPosition = "mask_position"
	}

}

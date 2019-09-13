//
//  TelegramAPI+UploadStickerFile.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to upload a .png file with a sticker for later use in createNewStickerSet and addStickerToSet methods (can be used multiple times). Returns the uploaded File on success.
	public func uploadStickerFile(_ input: TelegramUploadStickerFileInput, completionHandler: @escaping (TelegramResult<TelegramFile>) -> Void)
	{
		self.requester.request("uploadStickerFile", object: input, completion: completionHandler)
	}

}


public struct TelegramUploadStickerFileInput
{

	///User identifier of sticker file owner
	public let userId: TelegramInteger

	///Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. More info on Sending Files »
	public let pngSticker: TelegramInputFile

	public init(userId: TelegramInteger,
                pngSticker: TelegramInputFile)
	{
		self.userId = userId
		self.pngSticker = pngSticker
	}

}

extension TelegramUploadStickerFileInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case pngSticker = "png_sticker"
	}

}

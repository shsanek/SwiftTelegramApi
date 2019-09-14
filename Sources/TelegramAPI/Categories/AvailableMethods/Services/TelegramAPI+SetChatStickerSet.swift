//
//  TelegramAPI+SetChatStickerSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
	public func setChatStickerSet(_ input: TelegramSetChatStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setChatStickerSet", object: input, completion: completionHandler)
	}

}


public struct TelegramSetChatStickerSetInput
{

	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer

	///Name of the sticker set to be set as the group sticker set
	public let stickerSetName: String

	public init(chatId: TelegramIdentifierContainer,
                stickerSetName: String)
	{
		self.chatId = chatId
		self.stickerSetName = stickerSetName
	}

}

extension TelegramSetChatStickerSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case stickerSetName = "sticker_set_name"
	}

}


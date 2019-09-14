//
//  TelegramAPI+DeleteChatStickerSet.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
	public func deleteChatStickerSet(_ input: TelegramDeleteChatStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("deleteChatStickerSet", object: input, completion: completionHandler)
	}

}


public struct TelegramDeleteChatStickerSetInput
{

	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramDeleteChatStickerSetInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}


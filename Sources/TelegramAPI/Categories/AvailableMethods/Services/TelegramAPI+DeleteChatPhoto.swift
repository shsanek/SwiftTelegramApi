//
//  TelegramAPI+DeleteChatPhoto.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to delete a chat photo. Photos can&#39;t be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	public func deleteChatPhoto(_ input: TelegramDeleteChatPhotoInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("deleteChatPhoto", object: input, completion: completionHandler)
	}

}


public struct TelegramDeleteChatPhotoInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramDeleteChatPhotoInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}


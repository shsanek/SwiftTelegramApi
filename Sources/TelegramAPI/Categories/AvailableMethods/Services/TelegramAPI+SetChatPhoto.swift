//
//  TelegramAPI+SetChatPhoto.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to set a new profile photo for the chat. Photos can&#39;t be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	public func setChatPhoto(_ input: TelegramSetChatPhotoInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setChatPhoto", object: input, completion: completionHandler)
	}

}


public struct TelegramSetChatPhotoInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///New chat photo, uploaded using multipart/form-data
	public let photo: TelegramInputFile

	public init(chatId: TelegramIdentifierContainer,
                photo: TelegramInputFile)
	{
		self.chatId = chatId
		self.photo = photo
	}

}

extension TelegramSetChatPhotoInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case photo
	}

}

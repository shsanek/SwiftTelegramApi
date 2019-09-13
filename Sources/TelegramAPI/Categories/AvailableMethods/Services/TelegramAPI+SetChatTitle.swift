//
//  TelegramAPI+SetChatTitle.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to change the title of a chat. Titles can&#39;t be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	public func setChatTitle(_ input: TelegramSetChatTitleInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setChatTitle", object: input, completion: completionHandler)
	}

}


public struct TelegramSetChatTitleInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///New chat title, 1-255 characters
	public let title: String

	public init(chatId: TelegramIdentifierContainer,
                title: String)
	{
		self.chatId = chatId
		self.title = title
	}

}

extension TelegramSetChatTitleInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case title
	}

}

//
//  TelegramAPI+SetChatDescription.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	public func setChatDescription(_ input: TelegramSetChatDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setChatDescription", object: input, completion: completionHandler)
	}

}


public struct TelegramSetChatDescriptionInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///New chat description, 0-255 characters
	public let description: String?

	public init(chatId: TelegramIdentifierContainer,
                description: String? = nil)
	{
		self.chatId = chatId
		self.description = description
	}

}

extension TelegramSetChatDescriptionInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case description
	}

}

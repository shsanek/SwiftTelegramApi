//
//  TelegramAPI+GetChatMember.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to get information about a member of a chat. Returns a ChatMember object on success.
	public func getChatMember(_ input: TelegramGetChatMemberInput, completionHandler: @escaping (TelegramResult<TelegramChatMember>) -> Void)
	{
		self.requester.request("getChatMember", object: input, completion: completionHandler)
	}

}


public struct TelegramGetChatMemberInput
{

	///Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Unique identifier of the target user
	public let userId: TelegramInteger

	public init(chatId: TelegramIdentifierContainer,
                userId: TelegramInteger)
	{
		self.chatId = chatId
		self.userId = userId
	}

}

extension TelegramGetChatMemberInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case userId = "user_id"
	}

}

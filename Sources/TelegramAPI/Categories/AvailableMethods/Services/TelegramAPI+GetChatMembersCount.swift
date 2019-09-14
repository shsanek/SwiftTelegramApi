//
//  TelegramAPI+GetChatMembersCount.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to get the number of members in a chat. Returns Int on success.
	public func getChatMembersCount(_ input: TelegramGetChatMembersCountInput, completionHandler: @escaping (TelegramResult<TelegramInteger>) -> Void)
	{
		self.requester.request("getChatMembersCount", object: input, completion: completionHandler)
	}

}


public struct TelegramGetChatMembersCountInput
{

	///Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramGetChatMembersCountInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}


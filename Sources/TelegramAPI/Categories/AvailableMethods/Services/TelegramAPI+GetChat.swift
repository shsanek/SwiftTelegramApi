//
//  TelegramAPI+GetChat.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.
	public func getChat(_ input: TelegramGetChatInput, completionHandler: @escaping (TelegramResult<TelegramChat>) -> Void)
	{
		self.requester.request("getChat", object: input, completion: completionHandler)
	}

}


public struct TelegramGetChatInput
{

	///Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramGetChatInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}

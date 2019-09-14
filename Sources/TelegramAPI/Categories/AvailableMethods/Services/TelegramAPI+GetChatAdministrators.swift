//
//  TelegramAPI+GetChatAdministrators.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to get a list of administrators in a chat. On success, returns an Array of ChatMember objects that contains information about all chat administrators except other bots. If the chat is a group or a supergroup and no administrators were appointed, only the creator will be returned.
	public func getChatAdministrators(_ input: TelegramGetChatAdministratorsInput, completionHandler: @escaping (TelegramResult<[TelegramChatMember]>) -> Void)
	{
		self.requester.request("getChatAdministrators", object: input, completion: completionHandler)
	}

}


public struct TelegramGetChatAdministratorsInput
{

	///Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramGetChatAdministratorsInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}


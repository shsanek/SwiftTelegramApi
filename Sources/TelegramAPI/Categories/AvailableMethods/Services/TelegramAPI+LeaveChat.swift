//
//  TelegramAPI+LeaveChat.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
	public func leaveChat(_ input: TelegramLeaveChatInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("leaveChat", object: input, completion: completionHandler)
	}

}


public struct TelegramLeaveChatInput
{

	///Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramLeaveChatInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}


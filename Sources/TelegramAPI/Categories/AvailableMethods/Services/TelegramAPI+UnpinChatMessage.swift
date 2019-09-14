//
//  TelegramAPI+UnpinChatMessage.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to unpin a message in a group, a supergroup, or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success.
	public func unpinChatMessage(_ input: TelegramUnpinChatMessageInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("unpinChatMessage", object: input, completion: completionHandler)
	}

}


public struct TelegramUnpinChatMessageInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramUnpinChatMessageInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}


//
//  TelegramAPI+DeleteMessage.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to delete a message, including service messages, with the following limitations:- A message can only be deleted if it was sent less than 48 hours ago.- Bots can delete outgoing messages in private chats, groups, and supergroups.- Bots can delete incoming messages in private chats.- Bots granted can_post_messages permissions can delete outgoing messages in channels.- If the bot is an administrator of a group, it can delete any message there.- If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.Returns True on success.
	public func deleteMessage(_ input: TelegramDeleteMessageInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("deleteMessage", object: input, completion: completionHandler)
	}

}


public struct TelegramDeleteMessageInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Identifier of the message to delete
	public let messageId: TelegramInteger

	public init(chatId: TelegramIdentifierContainer,
                messageId: TelegramInteger)
	{
		self.chatId = chatId
		self.messageId = messageId
	}

}

extension TelegramDeleteMessageInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
	}

}


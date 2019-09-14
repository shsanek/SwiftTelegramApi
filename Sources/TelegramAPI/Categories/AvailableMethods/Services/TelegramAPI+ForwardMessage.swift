//
//  TelegramAPI+ForwardMessage.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to forward messages of any kind. On success, the sent Message is returned.
	public func forwardMessage(_ input: TelegramForwardMessageInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("forwardMessage", object: input, completion: completionHandler)
	}

}


public struct TelegramForwardMessageInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
	public let fromChatId: TelegramIdentifierContainer

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///Message identifier in the chat specified in from_chat_id
	public let messageId: TelegramInteger

	public init(chatId: TelegramIdentifierContainer,
                fromChatId: TelegramIdentifierContainer,
                disableNotification: Bool? = nil,
                messageId: TelegramInteger)
	{
		self.chatId = chatId
		self.fromChatId = fromChatId
		self.disableNotification = disableNotification
		self.messageId = messageId
	}

}

extension TelegramForwardMessageInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case fromChatId = "from_chat_id"
		case disableNotification = "disable_notification"
		case messageId = "message_id"
	}

}


//
//  TelegramAPI+PinChatMessage.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to pin a message in a group, a supergroup, or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success.
	public func pinChatMessage(_ input: TelegramPinChatMessageInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("pinChatMessage", object: input, completion: completionHandler)
	}

}


public struct TelegramPinChatMessageInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Identifier of a message to pin
	public let messageId: TelegramInteger

	///Pass True, if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels.
	public let disableNotification: Bool?

	public init(chatId: TelegramIdentifierContainer,
                messageId: TelegramInteger,
                disableNotification: Bool? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.disableNotification = disableNotification
	}

}

extension TelegramPinChatMessageInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case disableNotification = "disable_notification"
	}

}

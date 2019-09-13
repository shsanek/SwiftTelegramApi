//
//  TelegramAPI+UnbanChatMember.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to unban a previously kicked user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. Returns True on success.
	public func unbanChatMember(_ input: TelegramUnbanChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("unbanChatMember", object: input, completion: completionHandler)
	}

}


public struct TelegramUnbanChatMemberInput
{

	///Unique identifier for the target group or username of the target supergroup or channel (in the format @username)
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

extension TelegramUnbanChatMemberInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case userId = "user_id"
	}

}

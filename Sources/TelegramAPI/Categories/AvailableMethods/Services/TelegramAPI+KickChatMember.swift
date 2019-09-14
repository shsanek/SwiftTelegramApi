//
//  TelegramAPI+KickChatMember.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to kick a user from a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	public func kickChatMember(_ input: TelegramKickChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("kickChatMember", object: input, completion: completionHandler)
	}

}


public struct TelegramKickChatMemberInput
{

	///Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Unique identifier of the target user
	public let userId: TelegramInteger

	///Date when the user will be unbanned, unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever
	public let untilDate: TelegramInteger?

	public init(chatId: TelegramIdentifierContainer,
                userId: TelegramInteger,
                untilDate: TelegramInteger? = nil)
	{
		self.chatId = chatId
		self.userId = userId
		self.untilDate = untilDate
	}

}

extension TelegramKickChatMemberInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case userId = "user_id"
		case untilDate = "until_date"
	}

}


//
//  TelegramAPI+RestrictChatMember.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate admin rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.
	public func restrictChatMember(_ input: TelegramRestrictChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("restrictChatMember", object: input, completion: completionHandler)
	}

}


public struct TelegramRestrictChatMemberInput
{

	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer

	///Unique identifier of the target user
	public let userId: TelegramInteger

	///New user permissions
	public let permissions: TelegramChatPermissions

	///Date when restrictions will be lifted for the user, unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever
	public let untilDate: TelegramInteger?

	public init(chatId: TelegramIdentifierContainer,
                userId: TelegramInteger,
                permissions: TelegramChatPermissions,
                untilDate: TelegramInteger? = nil)
	{
		self.chatId = chatId
		self.userId = userId
		self.permissions = permissions
		self.untilDate = untilDate
	}

}

extension TelegramRestrictChatMemberInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case userId = "user_id"
		case permissions
		case untilDate = "until_date"
	}

}

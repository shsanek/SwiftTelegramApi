//
//  TelegramAPI+SetChatPermissions.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members admin rights. Returns True on success.
	public func setChatPermissions(_ input: TelegramSetChatPermissionsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setChatPermissions", object: input, completion: completionHandler)
	}

}


public struct TelegramSetChatPermissionsInput
{

	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer

	///New default chat permissions
	public let permissions: TelegramChatPermissions

	public init(chatId: TelegramIdentifierContainer,
                permissions: TelegramChatPermissions)
	{
		self.chatId = chatId
		self.permissions = permissions
	}

}

extension TelegramSetChatPermissionsInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case permissions
	}

}


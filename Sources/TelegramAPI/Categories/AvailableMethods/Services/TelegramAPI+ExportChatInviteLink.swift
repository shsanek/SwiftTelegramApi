//
//  TelegramAPI+ExportChatInviteLink.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to generate a new invite link for a chat; any previously generated link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns the new invite link as String on success.
	public func exportChatInviteLink(_ input: TelegramExportChatInviteLinkInput, completionHandler: @escaping (TelegramResult<String>) -> Void)
	{
		self.requester.request("exportChatInviteLink", object: input, completion: completionHandler)
	}

}


public struct TelegramExportChatInviteLinkInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(chatId: TelegramIdentifierContainer)
	{
		self.chatId = chatId
	}

}

extension TelegramExportChatInviteLinkInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
	}

}

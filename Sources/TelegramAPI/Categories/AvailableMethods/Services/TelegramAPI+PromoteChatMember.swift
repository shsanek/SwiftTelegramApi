//
//  TelegramAPI+PromoteChatMember.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Pass False for all boolean parameters to demote a user. Returns True on success.
	public func promoteChatMember(_ input: TelegramPromoteChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("promoteChatMember", object: input, completion: completionHandler)
	}

}


public struct TelegramPromoteChatMemberInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Unique identifier of the target user
	public let userId: TelegramInteger

	///Pass True, if the administrator can change chat title, photo and other settings
	public let canChangeInfo: Bool?

	///Pass True, if the administrator can create channel posts, channels only
	public let canPostMessages: Bool?

	///Pass True, if the administrator can edit messages of other users and can pin messages, channels only
	public let canEditMessages: Bool?

	///Pass True, if the administrator can delete messages of other users
	public let canDeleteMessages: Bool?

	///Pass True, if the administrator can invite new users to the chat
	public let canInviteUsers: Bool?

	///Pass True, if the administrator can restrict, ban or unban chat members
	public let canRestrictMembers: Bool?

	///Pass True, if the administrator can pin messages, supergroups only
	public let canPinMessages: Bool?

	///Pass True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by him)
	public let canPromoteMembers: Bool?

	public init(chatId: TelegramIdentifierContainer,
                userId: TelegramInteger,
                canChangeInfo: Bool? = nil,
                canPostMessages: Bool? = nil,
                canEditMessages: Bool? = nil,
                canDeleteMessages: Bool? = nil,
                canInviteUsers: Bool? = nil,
                canRestrictMembers: Bool? = nil,
                canPinMessages: Bool? = nil,
                canPromoteMembers: Bool? = nil)
	{
		self.chatId = chatId
		self.userId = userId
		self.canChangeInfo = canChangeInfo
		self.canPostMessages = canPostMessages
		self.canEditMessages = canEditMessages
		self.canDeleteMessages = canDeleteMessages
		self.canInviteUsers = canInviteUsers
		self.canRestrictMembers = canRestrictMembers
		self.canPinMessages = canPinMessages
		self.canPromoteMembers = canPromoteMembers
	}

}

extension TelegramPromoteChatMemberInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case userId = "user_id"
		case canChangeInfo = "can_change_info"
		case canPostMessages = "can_post_messages"
		case canEditMessages = "can_edit_messages"
		case canDeleteMessages = "can_delete_messages"
		case canInviteUsers = "can_invite_users"
		case canRestrictMembers = "can_restrict_members"
		case canPinMessages = "can_pin_messages"
		case canPromoteMembers = "can_promote_members"
	}

}

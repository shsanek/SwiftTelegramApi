//
//  TelegramChatMember.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object contains information about one member of a chat.
public struct TelegramChatMember
{

	///Information about the user
	public let user: TelegramUser

	///The member&#39;s status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
	public let status: String

	///Optional. Restricted and kicked only. Date when restrictions will be lifted for this user; unix time
	public let untilDate: TelegramInteger?

	///Optional. Administrators only. True, if the bot is allowed to edit administrator privileges of that user
	public let canBeEdited: Bool?

	///Optional. Administrators only. True, if the administrator can post in the channel; channels only
	public let canPostMessages: Bool?

	///Optional. Administrators only. True, if the administrator can edit messages of other users and can pin messages; channels only
	public let canEditMessages: Bool?

	///Optional. Administrators only. True, if the administrator can delete messages of other users
	public let canDeleteMessages: Bool?

	///Optional. Administrators only. True, if the administrator can restrict, ban or unban chat members
	public let canRestrictMembers: Bool?

	///Optional. Administrators only. True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
	public let canPromoteMembers: Bool?

	///Optional. Administrators and restricted only. True, if the user is allowed to change the chat title, photo and other settings
	public let canChangeInfo: Bool?

	///Optional. Administrators and restricted only. True, if the user is allowed to invite new users to the chat
	public let canInviteUsers: Bool?

	///Optional. Administrators and restricted only. True, if the user is allowed to pin messages; groups and supergroups only
	public let canPinMessages: Bool?

	///Optional. Restricted only. True, if the user is a member of the chat at the moment of the request
	public let isMember: Bool?

	///Optional. Restricted only. True, if the user is allowed to send text messages, contacts, locations and venues
	public let canSendMessages: Bool?

	///Optional. Restricted only. True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes
	public let canSendMediaMessages: Bool?

	///Optional. Restricted only. True, if the user is allowed to send polls
	public let canSendPolls: Bool?

	///Optional. Restricted only. True, if the user is allowed to send animations, games, stickers and use inline bots
	public let canSendOtherMessages: Bool?

	///Optional. Restricted only. True, if the user is allowed to add web page previews to their messages
	public let canAddWebPagePreviews: Bool?

	public init(user: TelegramUser,
                status: String,
                untilDate: TelegramInteger? = nil,
                canBeEdited: Bool? = nil,
                canPostMessages: Bool? = nil,
                canEditMessages: Bool? = nil,
                canDeleteMessages: Bool? = nil,
                canRestrictMembers: Bool? = nil,
                canPromoteMembers: Bool? = nil,
                canChangeInfo: Bool? = nil,
                canInviteUsers: Bool? = nil,
                canPinMessages: Bool? = nil,
                isMember: Bool? = nil,
                canSendMessages: Bool? = nil,
                canSendMediaMessages: Bool? = nil,
                canSendPolls: Bool? = nil,
                canSendOtherMessages: Bool? = nil,
                canAddWebPagePreviews: Bool? = nil)
	{
		self.user = user
		self.status = status
		self.untilDate = untilDate
		self.canBeEdited = canBeEdited
		self.canPostMessages = canPostMessages
		self.canEditMessages = canEditMessages
		self.canDeleteMessages = canDeleteMessages
		self.canRestrictMembers = canRestrictMembers
		self.canPromoteMembers = canPromoteMembers
		self.canChangeInfo = canChangeInfo
		self.canInviteUsers = canInviteUsers
		self.canPinMessages = canPinMessages
		self.isMember = isMember
		self.canSendMessages = canSendMessages
		self.canSendMediaMessages = canSendMediaMessages
		self.canSendPolls = canSendPolls
		self.canSendOtherMessages = canSendOtherMessages
		self.canAddWebPagePreviews = canAddWebPagePreviews
	}

}

extension TelegramChatMember: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case user
		case status
		case untilDate = "until_date"
		case canBeEdited = "can_be_edited"
		case canPostMessages = "can_post_messages"
		case canEditMessages = "can_edit_messages"
		case canDeleteMessages = "can_delete_messages"
		case canRestrictMembers = "can_restrict_members"
		case canPromoteMembers = "can_promote_members"
		case canChangeInfo = "can_change_info"
		case canInviteUsers = "can_invite_users"
		case canPinMessages = "can_pin_messages"
		case isMember = "is_member"
		case canSendMessages = "can_send_messages"
		case canSendMediaMessages = "can_send_media_messages"
		case canSendPolls = "can_send_polls"
		case canSendOtherMessages = "can_send_other_messages"
		case canAddWebPagePreviews = "can_add_web_page_previews"
	}

}
//
//  TelegramChat.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a chat.
public struct TelegramChat
{

	///Unique identifier for this chat. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	public let id: TelegramInteger

	///Type of chat, can be either “private”, “group”, “supergroup” or “channel”
	public let type: String

	///Optional. Title, for supergroups, channels and group chats
	public let title: String?

	///Optional. Username, for private chats, supergroups and channels if available
	public let username: String?

	///Optional. First name of the other party in a private chat
	public let firstName: String?

	///Optional. Last name of the other party in a private chat
	public let lastName: String?

	///Optional. Chat photo. Returned only in getChat.
	public let photo: TelegramChatPhoto?

	///Optional. Description, for groups, supergroups and channel chats. Returned only in getChat.
	public let description: String?

	///Optional. Chat invite link, for groups, supergroups and channel chats. Each administrator in a chat generates their own invite links, so the bot must first generate the link using exportChatInviteLink. Returned only in getChat.
	public let inviteLink: String?

	///Optional. Pinned message, for groups, supergroups and channels. Returned only in getChat.
	public let pinnedMessage: TelegramMessage?

	///Optional. Default chat member permissions, for groups and supergroups. Returned only in getChat.
	public let permissions: TelegramChatPermissions?

	///Optional. For supergroups, name of group sticker set. Returned only in getChat.
	public let stickerSetName: String?

	///Optional. True, if the bot can change the group sticker set. Returned only in getChat.
	public let canSetStickerSet: Bool?

	public init(id: TelegramInteger,
                type: String,
                title: String? = nil,
                username: String? = nil,
                firstName: String? = nil,
                lastName: String? = nil,
                photo: TelegramChatPhoto? = nil,
                description: String? = nil,
                inviteLink: String? = nil,
                pinnedMessage: TelegramMessage? = nil,
                permissions: TelegramChatPermissions? = nil,
                stickerSetName: String? = nil,
                canSetStickerSet: Bool? = nil)
	{
		self.id = id
		self.type = type
		self.title = title
		self.username = username
		self.firstName = firstName
		self.lastName = lastName
		self.photo = photo
		self.description = description
		self.inviteLink = inviteLink
		self.pinnedMessage = pinnedMessage
		self.permissions = permissions
		self.stickerSetName = stickerSetName
		self.canSetStickerSet = canSetStickerSet
	}

}

extension TelegramChat: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case type
		case title
		case username
		case firstName = "first_name"
		case lastName = "last_name"
		case photo
		case description
		case inviteLink = "invite_link"
		case pinnedMessage = "pinned_message"
		case permissions
		case stickerSetName = "sticker_set_name"
		case canSetStickerSet = "can_set_sticker_set"
	}

}

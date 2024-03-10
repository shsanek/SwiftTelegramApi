import Foundation
public final class Chat: Codable, IMultiPartFromDataValueEncodable {
	///Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
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
	
	///Optional. True, if the supergroup chat is a forum (has topics enabled)
	public let isForum: Bool?
	
	///Optional. Chat photo. Returned only in getChat.
	public let photo: ChatPhoto?
	
	///Optional. If non-empty, the list of all active chat usernames; for private chats, supergroups and channels. Returned only in getChat.
	public let activeUsernames: [String]?
	
	///Optional. Custom emoji identifier of emoji status of the other party in a private chat. Returned only in getChat.
	public let emojiStatusCustomEmojiId: String?
	
	///Optional. Expiration date of the emoji status of the other party in a private chat in Unix time, if any. Returned only in getChat.
	public let emojiStatusExpirationDate: TelegramInteger?
	
	///Optional. Bio of the other party in a private chat. Returned only in getChat.
	public let bio: String?
	
	///Optional. True, if privacy settings of the other party in the private chat allows to use tg://user?id=<user_id> links only in chats with the user. Returned only in getChat.
	public let hasPrivateForwards: Bool?
	
	///Optional. True, if the privacy settings of the other party restrict sending voice and video note messages in the private chat. Returned only in getChat.
	public let hasRestrictedVoiceAndVideoMessages: Bool?
	
	///Optional. True, if users need to join the supergroup before they can send messages. Returned only in getChat.
	public let joinToSendMessages: Bool?
	
	///Optional. True, if all users directly joining the supergroup need to be approved by supergroup administrators. Returned only in getChat.
	public let joinByRequest: Bool?
	
	///Optional. Description, for groups, supergroups and channel chats. Returned only in getChat.
	public let description: String?
	
	///Optional. Primary invite link, for groups, supergroups and channel chats. Returned only in getChat.
	public let inviteLink: String?
	
	///Optional. The most recent pinned message (by sending date). Returned only in getChat.
	public let pinnedMessage: Message?
	
	///Optional. Default chat member permissions, for groups and supergroups. Returned only in getChat.
	public let permissions: ChatPermissions?
	
	///Optional. For supergroups, the minimum allowed delay between consecutive messages sent by each unpriviledged user; in seconds. Returned only in getChat.
	public let slowModeDelay: TelegramInteger?
	
	///Optional. The time after which all messages sent to the chat will be automatically deleted; in seconds. Returned only in getChat.
	public let messageAutoDeleteTime: TelegramInteger?
	
	///Optional. True, if aggressive anti-spam checks are enabled in the supergroup. The field is only available to chat administrators. Returned only in getChat.
	public let hasAggressiveAntiSpamEnabled: Bool?
	
	///Optional. True, if non-administrators can only get the list of bots and administrators in the chat. Returned only in getChat.
	public let hasHiddenMembers: Bool?
	
	///Optional. True, if messages from the chat can't be forwarded to other chats. Returned only in getChat.
	public let hasProtectedContent: Bool?
	
	///Optional. For supergroups, name of group sticker set. Returned only in getChat.
	public let stickerSetName: String?
	
	///Optional. True, if the bot can change the group sticker set. Returned only in getChat.
	public let canSetStickerSet: Bool?
	
	///Optional. Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier. Returned only in getChat.
	public let linkedChatId: TelegramInteger?
	
	///Optional. For supergroups, the location to which the supergroup is connected. Returned only in getChat.
	public let location: ChatLocation?

	public init(
		id: TelegramInteger,
		type: String,
		title: String? = nil,
		username: String? = nil,
		firstName: String? = nil,
		lastName: String? = nil,
		isForum: Bool? = nil,
		photo: ChatPhoto? = nil,
		activeUsernames: [String]? = nil,
		emojiStatusCustomEmojiId: String? = nil,
		emojiStatusExpirationDate: TelegramInteger? = nil,
		bio: String? = nil,
		hasPrivateForwards: Bool? = nil,
		hasRestrictedVoiceAndVideoMessages: Bool? = nil,
		joinToSendMessages: Bool? = nil,
		joinByRequest: Bool? = nil,
		description: String? = nil,
		inviteLink: String? = nil,
		pinnedMessage: Message? = nil,
		permissions: ChatPermissions? = nil,
		slowModeDelay: TelegramInteger? = nil,
		messageAutoDeleteTime: TelegramInteger? = nil,
		hasAggressiveAntiSpamEnabled: Bool? = nil,
		hasHiddenMembers: Bool? = nil,
		hasProtectedContent: Bool? = nil,
		stickerSetName: String? = nil,
		canSetStickerSet: Bool? = nil,
		linkedChatId: TelegramInteger? = nil,
		location: ChatLocation? = nil
	) {
		self.id = id
		self.type = type
		self.title = title
		self.username = username
		self.firstName = firstName
		self.lastName = lastName
		self.isForum = isForum
		self.photo = photo
		self.activeUsernames = activeUsernames
		self.emojiStatusCustomEmojiId = emojiStatusCustomEmojiId
		self.emojiStatusExpirationDate = emojiStatusExpirationDate
		self.bio = bio
		self.hasPrivateForwards = hasPrivateForwards
		self.hasRestrictedVoiceAndVideoMessages = hasRestrictedVoiceAndVideoMessages
		self.joinToSendMessages = joinToSendMessages
		self.joinByRequest = joinByRequest
		self.description = description
		self.inviteLink = inviteLink
		self.pinnedMessage = pinnedMessage
		self.permissions = permissions
		self.slowModeDelay = slowModeDelay
		self.messageAutoDeleteTime = messageAutoDeleteTime
		self.hasAggressiveAntiSpamEnabled = hasAggressiveAntiSpamEnabled
		self.hasHiddenMembers = hasHiddenMembers
		self.hasProtectedContent = hasProtectedContent
		self.stickerSetName = stickerSetName
		self.canSetStickerSet = canSetStickerSet
		self.linkedChatId = linkedChatId
		self.location = location
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case type
		case title
		case username
		case firstName = "first_name"
		case lastName = "last_name"
		case isForum = "is_forum"
		case photo
		case activeUsernames = "active_usernames"
		case emojiStatusCustomEmojiId = "emoji_status_custom_emoji_id"
		case emojiStatusExpirationDate = "emoji_status_expiration_date"
		case bio
		case hasPrivateForwards = "has_private_forwards"
		case hasRestrictedVoiceAndVideoMessages = "has_restricted_voice_and_video_messages"
		case joinToSendMessages = "join_to_send_messages"
		case joinByRequest = "join_by_request"
		case description
		case inviteLink = "invite_link"
		case pinnedMessage = "pinned_message"
		case permissions
		case slowModeDelay = "slow_mode_delay"
		case messageAutoDeleteTime = "message_auto_delete_time"
		case hasAggressiveAntiSpamEnabled = "has_aggressive_anti_spam_enabled"
		case hasHiddenMembers = "has_hidden_members"
		case hasProtectedContent = "has_protected_content"
		case stickerSetName = "sticker_set_name"
		case canSetStickerSet = "can_set_sticker_set"
		case linkedChatId = "linked_chat_id"
		case location
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.type.self, forKey: .type)
		try container.encodeIfPresent(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.username.self, forKey: .username)
		try container.encodeIfPresent(self.firstName.self, forKey: .firstName)
		try container.encodeIfPresent(self.lastName.self, forKey: .lastName)
		try container.encodeIfPresent(self.isForum.self, forKey: .isForum)
		try container.encodeIfPresent(self.photo.self, forKey: .photo)
		try container.encodeIfPresent(self.activeUsernames.self, forKey: .activeUsernames)
		try container.encodeIfPresent(self.emojiStatusCustomEmojiId.self, forKey: .emojiStatusCustomEmojiId)
		try container.encodeIfPresent(self.emojiStatusExpirationDate.self, forKey: .emojiStatusExpirationDate)
		try container.encodeIfPresent(self.bio.self, forKey: .bio)
		try container.encodeIfPresent(self.hasPrivateForwards.self, forKey: .hasPrivateForwards)
		try container.encodeIfPresent(self.hasRestrictedVoiceAndVideoMessages.self, forKey: .hasRestrictedVoiceAndVideoMessages)
		try container.encodeIfPresent(self.joinToSendMessages.self, forKey: .joinToSendMessages)
		try container.encodeIfPresent(self.joinByRequest.self, forKey: .joinByRequest)
		try container.encodeIfPresent(self.description.self, forKey: .description)
		try container.encodeIfPresent(self.inviteLink.self, forKey: .inviteLink)
		try container.encodeIfPresent(self.pinnedMessage.self, forKey: .pinnedMessage)
		try container.encodeIfPresent(self.permissions.self, forKey: .permissions)
		try container.encodeIfPresent(self.slowModeDelay.self, forKey: .slowModeDelay)
		try container.encodeIfPresent(self.messageAutoDeleteTime.self, forKey: .messageAutoDeleteTime)
		try container.encodeIfPresent(self.hasAggressiveAntiSpamEnabled.self, forKey: .hasAggressiveAntiSpamEnabled)
		try container.encodeIfPresent(self.hasHiddenMembers.self, forKey: .hasHiddenMembers)
		try container.encodeIfPresent(self.hasProtectedContent.self, forKey: .hasProtectedContent)
		try container.encodeIfPresent(self.stickerSetName.self, forKey: .stickerSetName)
		try container.encodeIfPresent(self.canSetStickerSet.self, forKey: .canSetStickerSet)
		try container.encodeIfPresent(self.linkedChatId.self, forKey: .linkedChatId)
		try container.encodeIfPresent(self.location.self, forKey: .location)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(TelegramInteger.self, forKey: .id)
		self.type = try container.decode(String.self, forKey: .type)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.username = try container.decodeIfPresent(String.self, forKey: .username)
		self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
		self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
		self.isForum = try container.decodeIfPresent(Bool.self, forKey: .isForum)
		self.photo = try container.decodeIfPresent(ChatPhoto.self, forKey: .photo)
		self.activeUsernames = try container.decodeIfPresent([String].self, forKey: .activeUsernames)
		self.emojiStatusCustomEmojiId = try container.decodeIfPresent(String.self, forKey: .emojiStatusCustomEmojiId)
		self.emojiStatusExpirationDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .emojiStatusExpirationDate)
		self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
		self.hasPrivateForwards = try container.decodeIfPresent(Bool.self, forKey: .hasPrivateForwards)
		self.hasRestrictedVoiceAndVideoMessages = try container.decodeIfPresent(Bool.self, forKey: .hasRestrictedVoiceAndVideoMessages)
		self.joinToSendMessages = try container.decodeIfPresent(Bool.self, forKey: .joinToSendMessages)
		self.joinByRequest = try container.decodeIfPresent(Bool.self, forKey: .joinByRequest)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.inviteLink = try container.decodeIfPresent(String.self, forKey: .inviteLink)
		self.pinnedMessage = try container.decodeIfPresent(Message.self, forKey: .pinnedMessage)
		self.permissions = try container.decodeIfPresent(ChatPermissions.self, forKey: .permissions)
		self.slowModeDelay = try container.decodeIfPresent(TelegramInteger.self, forKey: .slowModeDelay)
		self.messageAutoDeleteTime = try container.decodeIfPresent(TelegramInteger.self, forKey: .messageAutoDeleteTime)
		self.hasAggressiveAntiSpamEnabled = try container.decodeIfPresent(Bool.self, forKey: .hasAggressiveAntiSpamEnabled)
		self.hasHiddenMembers = try container.decodeIfPresent(Bool.self, forKey: .hasHiddenMembers)
		self.hasProtectedContent = try container.decodeIfPresent(Bool.self, forKey: .hasProtectedContent)
		self.stickerSetName = try container.decodeIfPresent(String.self, forKey: .stickerSetName)
		self.canSetStickerSet = try container.decodeIfPresent(Bool.self, forKey: .canSetStickerSet)
		self.linkedChatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .linkedChatId)
		self.location = try container.decodeIfPresent(ChatLocation.self, forKey: .location)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
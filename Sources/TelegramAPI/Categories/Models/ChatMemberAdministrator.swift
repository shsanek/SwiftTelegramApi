public final class ChatMemberAdministrator: Codable, IMultiPartFromDataEncodable {
	///The member's status in the chat, always “administrator”
	public let status: String
	
	///Information about the user
	public let user: User
	
	///True, if the bot is allowed to edit administrator privileges of that user
	public let canBeEdited: Bool
	
	///True, if the user's presence in the chat is hidden
	public let isAnonymous: Bool
	
	///True, if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other administrator privilege
	public let canManageChat: Bool
	
	///True, if the administrator can delete messages of other users
	public let canDeleteMessages: Bool
	
	///True, if the administrator can manage video chats
	public let canManageVideoChats: Bool
	
	///True, if the administrator can restrict, ban or unban chat members
	public let canRestrictMembers: Bool
	
	///True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that they have promoted, directly or indirectly (promoted by administrators that were appointed by the user)
	public let canPromoteMembers: Bool
	
	///True, if the user is allowed to change the chat title, photo and other settings
	public let canChangeInfo: Bool
	
	///True, if the user is allowed to invite new users to the chat
	public let canInviteUsers: Bool
	
	///Optional. True, if the administrator can post in the channel; channels only
	public let canPostMessages: Bool?
	
	///Optional. True, if the administrator can edit messages of other users and can pin messages; channels only
	public let canEditMessages: Bool?
	
	///Optional. True, if the user is allowed to pin messages; groups and supergroups only
	public let canPinMessages: Bool?
	
	///Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
	public let canManageTopics: Bool?
	
	///Optional. Custom title for this user
	public let customTitle: String?

	public init(
		status: String,
		user: User,
		canBeEdited: Bool,
		isAnonymous: Bool,
		canManageChat: Bool,
		canDeleteMessages: Bool,
		canManageVideoChats: Bool,
		canRestrictMembers: Bool,
		canPromoteMembers: Bool,
		canChangeInfo: Bool,
		canInviteUsers: Bool,
		canPostMessages: Bool? = nil,
		canEditMessages: Bool? = nil,
		canPinMessages: Bool? = nil,
		canManageTopics: Bool? = nil,
		customTitle: String? = nil
	) {
		self.status = status
		self.user = user
		self.canBeEdited = canBeEdited
		self.isAnonymous = isAnonymous
		self.canManageChat = canManageChat
		self.canDeleteMessages = canDeleteMessages
		self.canManageVideoChats = canManageVideoChats
		self.canRestrictMembers = canRestrictMembers
		self.canPromoteMembers = canPromoteMembers
		self.canChangeInfo = canChangeInfo
		self.canInviteUsers = canInviteUsers
		self.canPostMessages = canPostMessages
		self.canEditMessages = canEditMessages
		self.canPinMessages = canPinMessages
		self.canManageTopics = canManageTopics
		self.customTitle = customTitle
	}

	private enum CodingKeys: String, CodingKey {
		case status
		case user
		case canBeEdited = "can_be_edited"
		case isAnonymous = "is_anonymous"
		case canManageChat = "can_manage_chat"
		case canDeleteMessages = "can_delete_messages"
		case canManageVideoChats = "can_manage_video_chats"
		case canRestrictMembers = "can_restrict_members"
		case canPromoteMembers = "can_promote_members"
		case canChangeInfo = "can_change_info"
		case canInviteUsers = "can_invite_users"
		case canPostMessages = "can_post_messages"
		case canEditMessages = "can_edit_messages"
		case canPinMessages = "can_pin_messages"
		case canManageTopics = "can_manage_topics"
		case customTitle = "custom_title"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.status.self, forKey: .status)
		try container.encode(self.user.self, forKey: .user)
		try container.encode(self.canBeEdited.self, forKey: .canBeEdited)
		try container.encode(self.isAnonymous.self, forKey: .isAnonymous)
		try container.encode(self.canManageChat.self, forKey: .canManageChat)
		try container.encode(self.canDeleteMessages.self, forKey: .canDeleteMessages)
		try container.encode(self.canManageVideoChats.self, forKey: .canManageVideoChats)
		try container.encode(self.canRestrictMembers.self, forKey: .canRestrictMembers)
		try container.encode(self.canPromoteMembers.self, forKey: .canPromoteMembers)
		try container.encode(self.canChangeInfo.self, forKey: .canChangeInfo)
		try container.encode(self.canInviteUsers.self, forKey: .canInviteUsers)
		try container.encodeIfPresent(self.canPostMessages.self, forKey: .canPostMessages)
		try container.encodeIfPresent(self.canEditMessages.self, forKey: .canEditMessages)
		try container.encodeIfPresent(self.canPinMessages.self, forKey: .canPinMessages)
		try container.encodeIfPresent(self.canManageTopics.self, forKey: .canManageTopics)
		try container.encodeIfPresent(self.customTitle.self, forKey: .customTitle)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.status = try container.decode(String.self, forKey: .status)
		self.user = try container.decode(User.self, forKey: .user)
		self.canBeEdited = try container.decode(Bool.self, forKey: .canBeEdited)
		self.isAnonymous = try container.decode(Bool.self, forKey: .isAnonymous)
		self.canManageChat = try container.decode(Bool.self, forKey: .canManageChat)
		self.canDeleteMessages = try container.decode(Bool.self, forKey: .canDeleteMessages)
		self.canManageVideoChats = try container.decode(Bool.self, forKey: .canManageVideoChats)
		self.canRestrictMembers = try container.decode(Bool.self, forKey: .canRestrictMembers)
		self.canPromoteMembers = try container.decode(Bool.self, forKey: .canPromoteMembers)
		self.canChangeInfo = try container.decode(Bool.self, forKey: .canChangeInfo)
		self.canInviteUsers = try container.decode(Bool.self, forKey: .canInviteUsers)
		self.canPostMessages = try container.decodeIfPresent(Bool.self, forKey: .canPostMessages)
		self.canEditMessages = try container.decodeIfPresent(Bool.self, forKey: .canEditMessages)
		self.canPinMessages = try container.decodeIfPresent(Bool.self, forKey: .canPinMessages)
		self.canManageTopics = try container.decodeIfPresent(Bool.self, forKey: .canManageTopics)
		self.customTitle = try container.decodeIfPresent(String.self, forKey: .customTitle)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("status", object: self.status)
		encoder.append("user", object: self.user)
		encoder.append("can_be_edited", object: self.canBeEdited)
		encoder.append("is_anonymous", object: self.isAnonymous)
		encoder.append("can_manage_chat", object: self.canManageChat)
		encoder.append("can_delete_messages", object: self.canDeleteMessages)
		encoder.append("can_manage_video_chats", object: self.canManageVideoChats)
		encoder.append("can_restrict_members", object: self.canRestrictMembers)
		encoder.append("can_promote_members", object: self.canPromoteMembers)
		encoder.append("can_change_info", object: self.canChangeInfo)
		encoder.append("can_invite_users", object: self.canInviteUsers)
		encoder.append("can_post_messages", object: self.canPostMessages)
		encoder.append("can_edit_messages", object: self.canEditMessages)
		encoder.append("can_pin_messages", object: self.canPinMessages)
		encoder.append("can_manage_topics", object: self.canManageTopics)
		encoder.append("custom_title", object: self.customTitle)
	}
}
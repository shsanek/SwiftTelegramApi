extension TelegramAPI {
    /// Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Pass False for all boolean parameters to demote a user. Returns True on success.
    public func promoteChatMember(_ input: PromoteChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("promoteChatMember", object: input, completion: completionHandler)
    }
}

//Input model for request promoteChatMember
public final class PromoteChatMemberInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let userId: TelegramInteger
	
	///Optional
	public let isAnonymous: Bool?
	
	///Optional
	public let canManageChat: Bool?
	
	///Optional
	public let canPostMessages: Bool?
	
	///Optional
	public let canEditMessages: Bool?
	
	///Optional
	public let canDeleteMessages: Bool?
	
	///Optional
	public let canManageVideoChats: Bool?
	
	///Optional
	public let canRestrictMembers: Bool?
	
	///Optional
	public let canPromoteMembers: Bool?
	
	///Optional
	public let canChangeInfo: Bool?
	
	///Optional
	public let canInviteUsers: Bool?
	
	///Optional
	public let canPinMessages: Bool?
	
	///Optional
	public let canManageTopics: Bool?

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		isAnonymous: Bool? = nil,
		canManageChat: Bool? = nil,
		canPostMessages: Bool? = nil,
		canEditMessages: Bool? = nil,
		canDeleteMessages: Bool? = nil,
		canManageVideoChats: Bool? = nil,
		canRestrictMembers: Bool? = nil,
		canPromoteMembers: Bool? = nil,
		canChangeInfo: Bool? = nil,
		canInviteUsers: Bool? = nil,
		canPinMessages: Bool? = nil,
		canManageTopics: Bool? = nil
	) {
		self.chatId = chatId
		self.userId = userId
		self.isAnonymous = isAnonymous
		self.canManageChat = canManageChat
		self.canPostMessages = canPostMessages
		self.canEditMessages = canEditMessages
		self.canDeleteMessages = canDeleteMessages
		self.canManageVideoChats = canManageVideoChats
		self.canRestrictMembers = canRestrictMembers
		self.canPromoteMembers = canPromoteMembers
		self.canChangeInfo = canChangeInfo
		self.canInviteUsers = canInviteUsers
		self.canPinMessages = canPinMessages
		self.canManageTopics = canManageTopics
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("user_id", object: self.userId)
		encoder.append("is_anonymous", object: self.isAnonymous)
		encoder.append("can_manage_chat", object: self.canManageChat)
		encoder.append("can_post_messages", object: self.canPostMessages)
		encoder.append("can_edit_messages", object: self.canEditMessages)
		encoder.append("can_delete_messages", object: self.canDeleteMessages)
		encoder.append("can_manage_video_chats", object: self.canManageVideoChats)
		encoder.append("can_restrict_members", object: self.canRestrictMembers)
		encoder.append("can_promote_members", object: self.canPromoteMembers)
		encoder.append("can_change_info", object: self.canChangeInfo)
		encoder.append("can_invite_users", object: self.canInviteUsers)
		encoder.append("can_pin_messages", object: self.canPinMessages)
		encoder.append("can_manage_topics", object: self.canManageTopics)
	}
}
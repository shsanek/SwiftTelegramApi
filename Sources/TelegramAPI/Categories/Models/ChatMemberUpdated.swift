public final class ChatMemberUpdated: Codable, IMultiPartFromDataEncodable {
	///Chat the user belongs to
	public let chat: Chat
	
	///Performer of the action, which resulted in the change
	public let from: User
	
	///Date the change was done in Unix time
	public let date: TelegramInteger
	
	///Previous information about the chat member
	public let oldChatMember: ChatMember
	
	///New information about the chat member
	public let newChatMember: ChatMember
	
	///Optional. Chat invite link, which was used by the user to join the chat; for joining by invite link events only.
	public let inviteLink: ChatInviteLink?
	
	///Optional. True, if the user joined the chat via a chat folder invite link
	public let viaChatFolderInviteLink: Bool?

	public init(
		chat: Chat,
		from: User,
		date: TelegramInteger,
		oldChatMember: ChatMember,
		newChatMember: ChatMember,
		inviteLink: ChatInviteLink? = nil,
		viaChatFolderInviteLink: Bool? = nil
	) {
		self.chat = chat
		self.from = from
		self.date = date
		self.oldChatMember = oldChatMember
		self.newChatMember = newChatMember
		self.inviteLink = inviteLink
		self.viaChatFolderInviteLink = viaChatFolderInviteLink
	}

	private enum CodingKeys: String, CodingKey {
		case chat
		case from
		case date
		case oldChatMember = "old_chat_member"
		case newChatMember = "new_chat_member"
		case inviteLink = "invite_link"
		case viaChatFolderInviteLink = "via_chat_folder_invite_link"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.chat.self, forKey: .chat)
		try container.encode(self.from.self, forKey: .from)
		try container.encode(self.date.self, forKey: .date)
		try container.encode(self.oldChatMember.self, forKey: .oldChatMember)
		try container.encode(self.newChatMember.self, forKey: .newChatMember)
		try container.encodeIfPresent(self.inviteLink.self, forKey: .inviteLink)
		try container.encodeIfPresent(self.viaChatFolderInviteLink.self, forKey: .viaChatFolderInviteLink)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.chat = try container.decode(Chat.self, forKey: .chat)
		self.from = try container.decode(User.self, forKey: .from)
		self.date = try container.decode(TelegramInteger.self, forKey: .date)
		self.oldChatMember = try container.decode(ChatMember.self, forKey: .oldChatMember)
		self.newChatMember = try container.decode(ChatMember.self, forKey: .newChatMember)
		self.inviteLink = try container.decodeIfPresent(ChatInviteLink.self, forKey: .inviteLink)
		self.viaChatFolderInviteLink = try container.decodeIfPresent(Bool.self, forKey: .viaChatFolderInviteLink)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat", object: self.chat)
		encoder.append("from", object: self.from)
		encoder.append("date", object: self.date)
		encoder.append("old_chat_member", object: self.oldChatMember)
		encoder.append("new_chat_member", object: self.newChatMember)
		encoder.append("invite_link", object: self.inviteLink)
		encoder.append("via_chat_folder_invite_link", object: self.viaChatFolderInviteLink)
	}
}
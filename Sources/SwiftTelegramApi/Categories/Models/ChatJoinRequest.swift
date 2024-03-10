import Foundation
public final class ChatJoinRequest: Codable, IMultiPartFromDataValueEncodable {
	///Chat to which the request was sent
	public let chat: Chat
	
	///User that sent the join request
	public let from: User
	
	///Identifier of a private chat with the user who sent the join request. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot can use this identifier for 24 hours to send messages until the join request is processed, assuming no other administrator contacted the user.
	public let userChatId: TelegramInteger
	
	///Date the request was sent in Unix time
	public let date: TelegramInteger
	
	///Optional. Bio of the user.
	public let bio: String?
	
	///Optional. Chat invite link that was used by the user to send the join request
	public let inviteLink: ChatInviteLink?

	public init(
		chat: Chat,
		from: User,
		userChatId: TelegramInteger,
		date: TelegramInteger,
		bio: String? = nil,
		inviteLink: ChatInviteLink? = nil
	) {
		self.chat = chat
		self.from = from
		self.userChatId = userChatId
		self.date = date
		self.bio = bio
		self.inviteLink = inviteLink
	}

	private enum CodingKeys: String, CodingKey {
		case chat
		case from
		case userChatId = "user_chat_id"
		case date
		case bio
		case inviteLink = "invite_link"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.chat.self, forKey: .chat)
		try container.encode(self.from.self, forKey: .from)
		try container.encode(self.userChatId.self, forKey: .userChatId)
		try container.encode(self.date.self, forKey: .date)
		try container.encodeIfPresent(self.bio.self, forKey: .bio)
		try container.encodeIfPresent(self.inviteLink.self, forKey: .inviteLink)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.chat = try container.decode(Chat.self, forKey: .chat)
		self.from = try container.decode(User.self, forKey: .from)
		self.userChatId = try container.decode(TelegramInteger.self, forKey: .userChatId)
		self.date = try container.decode(TelegramInteger.self, forKey: .date)
		self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
		self.inviteLink = try container.decodeIfPresent(ChatInviteLink.self, forKey: .inviteLink)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
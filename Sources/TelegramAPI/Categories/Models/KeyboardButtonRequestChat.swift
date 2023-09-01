import Foundation
public final class KeyboardButtonRequestChat: Codable, IMultiPartFromDataValueEncodable {
	///Signed 32-bit identifier of the request, which will be received back in the ChatShared object. Must be unique within the message
	public let requestId: TelegramInteger
	
	///Pass True to request a channel chat, pass False to request a group or a supergroup chat.
	public let chatIsChannel: Bool
	
	///Optional. Pass True to request a forum supergroup, pass False to request a non-forum chat. If not specified, no additional restrictions are applied.
	public let chatIsForum: Bool?
	
	///Optional. Pass True to request a supergroup or a channel with a username, pass False to request a chat without a username. If not specified, no additional restrictions are applied.
	public let chatHasUsername: Bool?
	
	///Optional. Pass True to request a chat owned by the user. Otherwise, no additional restrictions are applied.
	public let chatIsCreated: Bool?
	
	///Optional. A JSON-serialized object listing the required administrator rights of the user in the chat. The rights must be a superset of bot_administrator_rights. If not specified, no additional restrictions are applied.
	public let userAdministratorRights: ChatAdministratorRights?
	
	///Optional. A JSON-serialized object listing the required administrator rights of the bot in the chat. The rights must be a subset of user_administrator_rights. If not specified, no additional restrictions are applied.
	public let botAdministratorRights: ChatAdministratorRights?
	
	///Optional. Pass True to request a chat with the bot as a member. Otherwise, no additional restrictions are applied.
	public let botIsMember: Bool?

	public init(
		requestId: TelegramInteger,
		chatIsChannel: Bool,
		chatIsForum: Bool? = nil,
		chatHasUsername: Bool? = nil,
		chatIsCreated: Bool? = nil,
		userAdministratorRights: ChatAdministratorRights? = nil,
		botAdministratorRights: ChatAdministratorRights? = nil,
		botIsMember: Bool? = nil
	) {
		self.requestId = requestId
		self.chatIsChannel = chatIsChannel
		self.chatIsForum = chatIsForum
		self.chatHasUsername = chatHasUsername
		self.chatIsCreated = chatIsCreated
		self.userAdministratorRights = userAdministratorRights
		self.botAdministratorRights = botAdministratorRights
		self.botIsMember = botIsMember
	}

	private enum CodingKeys: String, CodingKey {
		case requestId = "request_id"
		case chatIsChannel = "chat_is_channel"
		case chatIsForum = "chat_is_forum"
		case chatHasUsername = "chat_has_username"
		case chatIsCreated = "chat_is_created"
		case userAdministratorRights = "user_administrator_rights"
		case botAdministratorRights = "bot_administrator_rights"
		case botIsMember = "bot_is_member"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.requestId.self, forKey: .requestId)
		try container.encode(self.chatIsChannel.self, forKey: .chatIsChannel)
		try container.encodeIfPresent(self.chatIsForum.self, forKey: .chatIsForum)
		try container.encodeIfPresent(self.chatHasUsername.self, forKey: .chatHasUsername)
		try container.encodeIfPresent(self.chatIsCreated.self, forKey: .chatIsCreated)
		try container.encodeIfPresent(self.userAdministratorRights.self, forKey: .userAdministratorRights)
		try container.encodeIfPresent(self.botAdministratorRights.self, forKey: .botAdministratorRights)
		try container.encodeIfPresent(self.botIsMember.self, forKey: .botIsMember)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.requestId = try container.decode(TelegramInteger.self, forKey: .requestId)
		self.chatIsChannel = try container.decode(Bool.self, forKey: .chatIsChannel)
		self.chatIsForum = try container.decodeIfPresent(Bool.self, forKey: .chatIsForum)
		self.chatHasUsername = try container.decodeIfPresent(Bool.self, forKey: .chatHasUsername)
		self.chatIsCreated = try container.decodeIfPresent(Bool.self, forKey: .chatIsCreated)
		self.userAdministratorRights = try container.decodeIfPresent(ChatAdministratorRights.self, forKey: .userAdministratorRights)
		self.botAdministratorRights = try container.decodeIfPresent(ChatAdministratorRights.self, forKey: .botAdministratorRights)
		self.botIsMember = try container.decodeIfPresent(Bool.self, forKey: .botIsMember)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
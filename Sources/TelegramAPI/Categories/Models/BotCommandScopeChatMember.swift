import Foundation
public final class BotCommandScopeChatMember: Codable, IMultiPartFromDataValueEncodable {
	///Scope type, must be chat_member
	public let type: String
	
	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Unique identifier of the target user
	public let userId: TelegramInteger

	public init(
		type: String,
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger
	) {
		self.type = type
		self.chatId = chatId
		self.userId = userId
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case chatId = "chat_id"
		case userId = "user_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.chatId.self, forKey: .chatId)
		try container.encode(self.userId.self, forKey: .userId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.chatId = try container.decode(TelegramIdentifierContainer.self, forKey: .chatId)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class BotCommandScopeChatAdministrators: Codable, IMultiPartFromDataValueEncodable {
	///Scope type, must be chat_administrators
	public let type: String
	
	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer

	public init(
		type: String,
		chatId: TelegramIdentifierContainer
	) {
		self.type = type
		self.chatId = chatId
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case chatId = "chat_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.chatId.self, forKey: .chatId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.chatId = try container.decode(TelegramIdentifierContainer.self, forKey: .chatId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
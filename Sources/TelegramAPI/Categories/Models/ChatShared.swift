import Foundation
public final class ChatShared: Codable, IMultiPartFromDataValueEncodable {
	///Identifier of the request
	public let requestId: TelegramInteger
	
	///Identifier of the shared chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the chat and could be unable to use this identifier, unless the chat is already known to the bot by some other means.
	public let chatId: TelegramInteger

	public init(
		requestId: TelegramInteger,
		chatId: TelegramInteger
	) {
		self.requestId = requestId
		self.chatId = chatId
	}

	private enum CodingKeys: String, CodingKey {
		case requestId = "request_id"
		case chatId = "chat_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.requestId.self, forKey: .requestId)
		try container.encode(self.chatId.self, forKey: .chatId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.requestId = try container.decode(TelegramInteger.self, forKey: .requestId)
		self.chatId = try container.decode(TelegramInteger.self, forKey: .chatId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
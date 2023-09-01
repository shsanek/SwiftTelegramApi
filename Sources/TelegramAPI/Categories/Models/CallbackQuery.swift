import Foundation
public final class CallbackQuery: Codable, IMultiPartFromDataValueEncodable {
	///Unique identifier for this query
	public let id: String
	
	///Sender
	public let from: User
	
	///Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
	public let message: Message?
	
	///Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
	public let inlineMessageId: String?
	
	///Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
	public let chatInstance: String
	
	///Optional. Data associated with the callback button. Be aware that the message originated the query can contain no callback buttons with this data.
	public let data: String?
	
	///Optional. Short name of a Game to be returned, serves as the unique identifier for the game
	public let gameShortName: String?

	public init(
		id: String,
		from: User,
		message: Message? = nil,
		inlineMessageId: String? = nil,
		chatInstance: String,
		data: String? = nil,
		gameShortName: String? = nil
	) {
		self.id = id
		self.from = from
		self.message = message
		self.inlineMessageId = inlineMessageId
		self.chatInstance = chatInstance
		self.data = data
		self.gameShortName = gameShortName
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case from
		case message
		case inlineMessageId = "inline_message_id"
		case chatInstance = "chat_instance"
		case data
		case gameShortName = "game_short_name"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.from.self, forKey: .from)
		try container.encodeIfPresent(self.message.self, forKey: .message)
		try container.encodeIfPresent(self.inlineMessageId.self, forKey: .inlineMessageId)
		try container.encode(self.chatInstance.self, forKey: .chatInstance)
		try container.encodeIfPresent(self.data.self, forKey: .data)
		try container.encodeIfPresent(self.gameShortName.self, forKey: .gameShortName)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .id)
		self.from = try container.decode(User.self, forKey: .from)
		self.message = try container.decodeIfPresent(Message.self, forKey: .message)
		self.inlineMessageId = try container.decodeIfPresent(String.self, forKey: .inlineMessageId)
		self.chatInstance = try container.decode(String.self, forKey: .chatInstance)
		self.data = try container.decodeIfPresent(String.self, forKey: .data)
		self.gameShortName = try container.decodeIfPresent(String.self, forKey: .gameShortName)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
public final class InlineQuery: Codable, IMultiPartFromDataEncodable {
	///Unique identifier for this query
	public let id: String
	
	///Sender
	public let from: User
	
	///Text of the query (up to 256 characters)
	public let query: String
	
	///Offset of the results to be returned, can be controlled by the bot
	public let offset: String
	
	///Optional. Type of the chat from which the inline query was sent. Can be either “sender” for a private chat with the inline query sender, “private”, “group”, “supergroup”, or “channel”. The chat type should be always known for requests sent from official clients and most third-party clients, unless the request was sent from a secret chat
	public let chatType: String?
	
	///Optional. Sender location, only for bots that request user location
	public let location: Location?

	public init(
		id: String,
		from: User,
		query: String,
		offset: String,
		chatType: String? = nil,
		location: Location? = nil
	) {
		self.id = id
		self.from = from
		self.query = query
		self.offset = offset
		self.chatType = chatType
		self.location = location
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case from
		case query
		case offset
		case chatType = "chat_type"
		case location
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.from.self, forKey: .from)
		try container.encode(self.query.self, forKey: .query)
		try container.encode(self.offset.self, forKey: .offset)
		try container.encodeIfPresent(self.chatType.self, forKey: .chatType)
		try container.encodeIfPresent(self.location.self, forKey: .location)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .id)
		self.from = try container.decode(User.self, forKey: .from)
		self.query = try container.decode(String.self, forKey: .query)
		self.offset = try container.decode(String.self, forKey: .offset)
		self.chatType = try container.decodeIfPresent(String.self, forKey: .chatType)
		self.location = try container.decodeIfPresent(Location.self, forKey: .location)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("id", object: self.id)
		encoder.append("from", object: self.from)
		encoder.append("query", object: self.query)
		encoder.append("offset", object: self.offset)
		encoder.append("chat_type", object: self.chatType)
		encoder.append("location", object: self.location)
	}
}
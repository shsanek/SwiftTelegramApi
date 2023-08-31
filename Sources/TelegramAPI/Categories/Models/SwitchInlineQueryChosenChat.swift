public final class SwitchInlineQueryChosenChat: Codable, IMultiPartFromDataEncodable {
	///Optional. The default inline query to be inserted in the input field. If left empty, only the bot's username will be inserted
	public let query: String?
	
	///Optional. True, if private chats with users can be chosen
	public let allowUserChats: Bool?
	
	///Optional. True, if private chats with bots can be chosen
	public let allowBotChats: Bool?
	
	///Optional. True, if group and supergroup chats can be chosen
	public let allowGroupChats: Bool?
	
	///Optional. True, if channel chats can be chosen
	public let allowChannelChats: Bool?

	public init(
		query: String? = nil,
		allowUserChats: Bool? = nil,
		allowBotChats: Bool? = nil,
		allowGroupChats: Bool? = nil,
		allowChannelChats: Bool? = nil
	) {
		self.query = query
		self.allowUserChats = allowUserChats
		self.allowBotChats = allowBotChats
		self.allowGroupChats = allowGroupChats
		self.allowChannelChats = allowChannelChats
	}

	private enum CodingKeys: String, CodingKey {
		case query
		case allowUserChats = "allow_user_chats"
		case allowBotChats = "allow_bot_chats"
		case allowGroupChats = "allow_group_chats"
		case allowChannelChats = "allow_channel_chats"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.query.self, forKey: .query)
		try container.encodeIfPresent(self.allowUserChats.self, forKey: .allowUserChats)
		try container.encodeIfPresent(self.allowBotChats.self, forKey: .allowBotChats)
		try container.encodeIfPresent(self.allowGroupChats.self, forKey: .allowGroupChats)
		try container.encodeIfPresent(self.allowChannelChats.self, forKey: .allowChannelChats)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.query = try container.decodeIfPresent(String.self, forKey: .query)
		self.allowUserChats = try container.decodeIfPresent(Bool.self, forKey: .allowUserChats)
		self.allowBotChats = try container.decodeIfPresent(Bool.self, forKey: .allowBotChats)
		self.allowGroupChats = try container.decodeIfPresent(Bool.self, forKey: .allowGroupChats)
		self.allowChannelChats = try container.decodeIfPresent(Bool.self, forKey: .allowChannelChats)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("query", object: self.query)
		encoder.append("allow_user_chats", object: self.allowUserChats)
		encoder.append("allow_bot_chats", object: self.allowBotChats)
		encoder.append("allow_group_chats", object: self.allowGroupChats)
		encoder.append("allow_channel_chats", object: self.allowChannelChats)
	}
}
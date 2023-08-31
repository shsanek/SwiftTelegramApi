public final class ForumTopic: Codable, IMultiPartFromDataEncodable {
	///Unique identifier of the forum topic
	public let messageThreadId: TelegramInteger
	
	///Name of the topic
	public let name: String
	
	///Color of the topic icon in RGB format
	public let iconColor: TelegramInteger
	
	///Optional. Unique identifier of the custom emoji shown as the topic icon
	public let iconCustomEmojiId: String?

	public init(
		messageThreadId: TelegramInteger,
		name: String,
		iconColor: TelegramInteger,
		iconCustomEmojiId: String? = nil
	) {
		self.messageThreadId = messageThreadId
		self.name = name
		self.iconColor = iconColor
		self.iconCustomEmojiId = iconCustomEmojiId
	}

	private enum CodingKeys: String, CodingKey {
		case messageThreadId = "message_thread_id"
		case name
		case iconColor = "icon_color"
		case iconCustomEmojiId = "icon_custom_emoji_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.messageThreadId.self, forKey: .messageThreadId)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.iconColor.self, forKey: .iconColor)
		try container.encodeIfPresent(self.iconCustomEmojiId.self, forKey: .iconCustomEmojiId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.messageThreadId = try container.decode(TelegramInteger.self, forKey: .messageThreadId)
		self.name = try container.decode(String.self, forKey: .name)
		self.iconColor = try container.decode(TelegramInteger.self, forKey: .iconColor)
		self.iconCustomEmojiId = try container.decodeIfPresent(String.self, forKey: .iconCustomEmojiId)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("name", object: self.name)
		encoder.append("icon_color", object: self.iconColor)
		encoder.append("icon_custom_emoji_id", object: self.iconCustomEmojiId)
	}
}
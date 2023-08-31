public final class ForumTopicCreated: Codable, IMultiPartFromDataEncodable {
	///Name of the topic
	public let name: String
	
	///Color of the topic icon in RGB format
	public let iconColor: TelegramInteger
	
	///Optional. Unique identifier of the custom emoji shown as the topic icon
	public let iconCustomEmojiId: String?

	public init(
		name: String,
		iconColor: TelegramInteger,
		iconCustomEmojiId: String? = nil
	) {
		self.name = name
		self.iconColor = iconColor
		self.iconCustomEmojiId = iconCustomEmojiId
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case iconColor = "icon_color"
		case iconCustomEmojiId = "icon_custom_emoji_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.iconColor.self, forKey: .iconColor)
		try container.encodeIfPresent(self.iconCustomEmojiId.self, forKey: .iconCustomEmojiId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
		self.iconColor = try container.decode(TelegramInteger.self, forKey: .iconColor)
		self.iconCustomEmojiId = try container.decodeIfPresent(String.self, forKey: .iconCustomEmojiId)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("name", object: self.name)
		encoder.append("icon_color", object: self.iconColor)
		encoder.append("icon_custom_emoji_id", object: self.iconCustomEmojiId)
	}
}
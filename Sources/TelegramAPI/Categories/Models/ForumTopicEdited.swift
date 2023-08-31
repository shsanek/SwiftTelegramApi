public final class ForumTopicEdited: Codable, IMultiPartFromDataEncodable {
	///Optional. New name of the topic, if it was edited
	public let name: String?
	
	///Optional. New identifier of the custom emoji shown as the topic icon, if it was edited; an empty string if the icon was removed
	public let iconCustomEmojiId: String?

	public init(
		name: String? = nil,
		iconCustomEmojiId: String? = nil
	) {
		self.name = name
		self.iconCustomEmojiId = iconCustomEmojiId
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case iconCustomEmojiId = "icon_custom_emoji_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.name.self, forKey: .name)
		try container.encodeIfPresent(self.iconCustomEmojiId.self, forKey: .iconCustomEmojiId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.iconCustomEmojiId = try container.decodeIfPresent(String.self, forKey: .iconCustomEmojiId)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("name", object: self.name)
		encoder.append("icon_custom_emoji_id", object: self.iconCustomEmojiId)
	}
}
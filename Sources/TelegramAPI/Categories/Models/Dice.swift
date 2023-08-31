public final class Dice: Codable, IMultiPartFromDataEncodable {
	///Emoji on which the dice throw animation is based
	public let emoji: String
	
	///Value of the dice, 1-6 for “”, “” and “” base emoji, 1-5 for “” and “” base emoji, 1-64 for “” base emoji
	public let value: TelegramInteger

	public init(
		emoji: String,
		value: TelegramInteger
	) {
		self.emoji = emoji
		self.value = value
	}

	private enum CodingKeys: String, CodingKey {
		case emoji
		case value
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.emoji.self, forKey: .emoji)
		try container.encode(self.value.self, forKey: .value)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.emoji = try container.decode(String.self, forKey: .emoji)
		self.value = try container.decode(TelegramInteger.self, forKey: .value)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("emoji", object: self.emoji)
		encoder.append("value", object: self.value)
	}
}
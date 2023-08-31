public final class InlineKeyboardMarkup: Codable, IMultiPartFromDataEncodable {
	///Array of button rows, each represented by an Array of InlineKeyboardButton objects
	public let inlineKeyboard: [[InlineKeyboardButton]]

	public init(
		inlineKeyboard: [[InlineKeyboardButton]]
	) {
		self.inlineKeyboard = inlineKeyboard
	}

	private enum CodingKeys: String, CodingKey {
		case inlineKeyboard = "inline_keyboard"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.inlineKeyboard.self, forKey: .inlineKeyboard)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.inlineKeyboard = try container.decode([[InlineKeyboardButton]].self, forKey: .inlineKeyboard)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("inline_keyboard", object: self.inlineKeyboard)
	}
}
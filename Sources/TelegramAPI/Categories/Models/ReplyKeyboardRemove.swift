public final class ReplyKeyboardRemove: Codable, IMultiPartFromDataEncodable {
	///Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use one_time_keyboard in ReplyKeyboardMarkup)
	public let removeKeyboard: Bool
	
	///Optional. Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet.
	public let selective: Bool?

	public init(
		removeKeyboard: Bool,
		selective: Bool? = nil
	) {
		self.removeKeyboard = removeKeyboard
		self.selective = selective
	}

	private enum CodingKeys: String, CodingKey {
		case removeKeyboard = "remove_keyboard"
		case selective
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.removeKeyboard.self, forKey: .removeKeyboard)
		try container.encodeIfPresent(self.selective.self, forKey: .selective)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.removeKeyboard = try container.decode(Bool.self, forKey: .removeKeyboard)
		self.selective = try container.decodeIfPresent(Bool.self, forKey: .selective)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("remove_keyboard", object: self.removeKeyboard)
		encoder.append("selective", object: self.selective)
	}
}
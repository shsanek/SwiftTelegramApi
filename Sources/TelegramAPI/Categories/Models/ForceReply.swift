public final class ForceReply: Codable, IMultiPartFromDataEncodable {
	///Shows reply interface to the user, as if they manually selected the bot's message and tapped 'Reply'
	public let forceReply: Bool
	
	///Optional. The placeholder to be shown in the input field when the reply is active; 1-64 characters
	public let inputFieldPlaceholder: String?
	
	///Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
	public let selective: Bool?

	public init(
		forceReply: Bool,
		inputFieldPlaceholder: String? = nil,
		selective: Bool? = nil
	) {
		self.forceReply = forceReply
		self.inputFieldPlaceholder = inputFieldPlaceholder
		self.selective = selective
	}

	private enum CodingKeys: String, CodingKey {
		case forceReply = "force_reply"
		case inputFieldPlaceholder = "input_field_placeholder"
		case selective
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.forceReply.self, forKey: .forceReply)
		try container.encodeIfPresent(self.inputFieldPlaceholder.self, forKey: .inputFieldPlaceholder)
		try container.encodeIfPresent(self.selective.self, forKey: .selective)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.forceReply = try container.decode(Bool.self, forKey: .forceReply)
		self.inputFieldPlaceholder = try container.decodeIfPresent(String.self, forKey: .inputFieldPlaceholder)
		self.selective = try container.decodeIfPresent(Bool.self, forKey: .selective)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("force_reply", object: self.forceReply)
		encoder.append("input_field_placeholder", object: self.inputFieldPlaceholder)
		encoder.append("selective", object: self.selective)
	}
}
public final class BotCommand: Codable, IMultiPartFromDataEncodable {
	///Text of the command; 1-32 characters. Can contain only lowercase English letters, digits and underscores.
	public let command: String
	
	///Description of the command; 1-256 characters.
	public let description: String

	public init(
		command: String,
		description: String
	) {
		self.command = command
		self.description = description
	}

	private enum CodingKeys: String, CodingKey {
		case command
		case description
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.command.self, forKey: .command)
		try container.encode(self.description.self, forKey: .description)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.command = try container.decode(String.self, forKey: .command)
		self.description = try container.decode(String.self, forKey: .description)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("command", object: self.command)
		encoder.append("description", object: self.description)
	}
}
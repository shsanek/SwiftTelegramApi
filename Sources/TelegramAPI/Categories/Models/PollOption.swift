public final class PollOption: Codable, IMultiPartFromDataEncodable {
	///Option text, 1-100 characters
	public let text: String
	
	///Number of users that voted for this option
	public let voterCount: TelegramInteger

	public init(
		text: String,
		voterCount: TelegramInteger
	) {
		self.text = text
		self.voterCount = voterCount
	}

	private enum CodingKeys: String, CodingKey {
		case text
		case voterCount = "voter_count"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.text.self, forKey: .text)
		try container.encode(self.voterCount.self, forKey: .voterCount)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.text = try container.decode(String.self, forKey: .text)
		self.voterCount = try container.decode(TelegramInteger.self, forKey: .voterCount)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("text", object: self.text)
		encoder.append("voter_count", object: self.voterCount)
	}
}
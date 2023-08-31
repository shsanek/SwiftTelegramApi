public final class BotName: Codable, IMultiPartFromDataEncodable {
	///The bot's name
	public let name: String

	public init(
		name: String
	) {
		self.name = name
	}

	private enum CodingKeys: String, CodingKey {
		case name
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("name", object: self.name)
	}
}
public final class KeyboardButtonPollType: Codable, IMultiPartFromDataEncodable {
	///Optional. If quiz is passed, the user will be allowed to create only polls in the quiz mode. If regular is passed, only regular polls will be allowed. Otherwise, the user will be allowed to create a poll of any type.
	public let type: String?

	public init(
		type: String? = nil
	) {
		self.type = type
	}

	private enum CodingKeys: String, CodingKey {
		case type
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.type.self, forKey: .type)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decodeIfPresent(String.self, forKey: .type)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
	}
}
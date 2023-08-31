public final class SentWebAppMessage: Codable, IMultiPartFromDataEncodable {
	///Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message.
	public let inlineMessageId: String?

	public init(
		inlineMessageId: String? = nil
	) {
		self.inlineMessageId = inlineMessageId
	}

	private enum CodingKeys: String, CodingKey {
		case inlineMessageId = "inline_message_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.inlineMessageId.self, forKey: .inlineMessageId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.inlineMessageId = try container.decodeIfPresent(String.self, forKey: .inlineMessageId)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("inline_message_id", object: self.inlineMessageId)
	}
}
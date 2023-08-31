public final class ResponseParameters: Codable, IMultiPartFromDataEncodable {
	///Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
	public let migrateToChatId: TelegramInteger?
	
	///Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
	public let retryAfter: TelegramInteger?

	public init(
		migrateToChatId: TelegramInteger? = nil,
		retryAfter: TelegramInteger? = nil
	) {
		self.migrateToChatId = migrateToChatId
		self.retryAfter = retryAfter
	}

	private enum CodingKeys: String, CodingKey {
		case migrateToChatId = "migrate_to_chat_id"
		case retryAfter = "retry_after"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.migrateToChatId.self, forKey: .migrateToChatId)
		try container.encodeIfPresent(self.retryAfter.self, forKey: .retryAfter)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.migrateToChatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .migrateToChatId)
		self.retryAfter = try container.decodeIfPresent(TelegramInteger.self, forKey: .retryAfter)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("migrate_to_chat_id", object: self.migrateToChatId)
		encoder.append("retry_after", object: self.retryAfter)
	}
}
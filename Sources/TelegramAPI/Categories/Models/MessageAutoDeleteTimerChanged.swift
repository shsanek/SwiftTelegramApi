public final class MessageAutoDeleteTimerChanged: Codable, IMultiPartFromDataEncodable {
	///New auto-delete time for messages in the chat; in seconds
	public let messageAutoDeleteTime: TelegramInteger

	public init(
		messageAutoDeleteTime: TelegramInteger
	) {
		self.messageAutoDeleteTime = messageAutoDeleteTime
	}

	private enum CodingKeys: String, CodingKey {
		case messageAutoDeleteTime = "message_auto_delete_time"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.messageAutoDeleteTime.self, forKey: .messageAutoDeleteTime)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.messageAutoDeleteTime = try container.decode(TelegramInteger.self, forKey: .messageAutoDeleteTime)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("message_auto_delete_time", object: self.messageAutoDeleteTime)
	}
}
public final class InlineQueryResultCachedSticker: Codable, IMultiPartFromDataEncodable {
	///Type of the result, must be sticker
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///A valid file identifier of the sticker
	public let stickerFileId: String
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the sticker
	public let inputMessageContent: InputMessageContent?

	public init(
		type: String,
		id: String,
		stickerFileId: String,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil
	) {
		self.type = type
		self.id = id
		self.stickerFileId = stickerFileId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case stickerFileId = "sticker_file_id"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.stickerFileId.self, forKey: .stickerFileId)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.inputMessageContent.self, forKey: .inputMessageContent)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.stickerFileId = try container.decode(String.self, forKey: .stickerFileId)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("id", object: self.id)
		encoder.append("sticker_file_id", object: self.stickerFileId)
		encoder.append("reply_markup", object: self.replyMarkup)
		encoder.append("input_message_content", object: self.inputMessageContent)
	}
}
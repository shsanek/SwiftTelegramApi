public final class InlineQueryResultVoice: Codable, IMultiPartFromDataEncodable {
	///Type of the result, must be voice
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///A valid URL for the voice recording
	public let voiceUrl: String
	
	///Recording title
	public let title: String
	
	///Optional. Caption, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Recording duration in seconds
	public let voiceDuration: TelegramInteger?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the voice recording
	public let inputMessageContent: InputMessageContent?

	public init(
		type: String,
		id: String,
		voiceUrl: String,
		title: String,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		voiceDuration: TelegramInteger? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil
	) {
		self.type = type
		self.id = id
		self.voiceUrl = voiceUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.voiceDuration = voiceDuration
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case voiceUrl = "voice_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case voiceDuration = "voice_duration"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.voiceUrl.self, forKey: .voiceUrl)
		try container.encode(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.voiceDuration.self, forKey: .voiceDuration)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.inputMessageContent.self, forKey: .inputMessageContent)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.voiceUrl = try container.decode(String.self, forKey: .voiceUrl)
		self.title = try container.decode(String.self, forKey: .title)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.voiceDuration = try container.decodeIfPresent(TelegramInteger.self, forKey: .voiceDuration)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("id", object: self.id)
		encoder.append("voice_url", object: self.voiceUrl)
		encoder.append("title", object: self.title)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("voice_duration", object: self.voiceDuration)
		encoder.append("reply_markup", object: self.replyMarkup)
		encoder.append("input_message_content", object: self.inputMessageContent)
	}
}
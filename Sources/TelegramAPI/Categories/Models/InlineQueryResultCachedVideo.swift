public final class InlineQueryResultCachedVideo: Codable, IMultiPartFromDataEncodable {
	///Type of the result, must be video
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///A valid file identifier for the video file
	public let videoFileId: String
	
	///Title for the result
	public let title: String
	
	///Optional. Short description of the result
	public let description: String?
	
	///Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the video caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the video
	public let inputMessageContent: InputMessageContent?

	public init(
		type: String,
		id: String,
		videoFileId: String,
		title: String,
		description: String? = nil,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil
	) {
		self.type = type
		self.id = id
		self.videoFileId = videoFileId
		self.title = title
		self.description = description
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case videoFileId = "video_file_id"
		case title
		case description
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.videoFileId.self, forKey: .videoFileId)
		try container.encode(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.description.self, forKey: .description)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.inputMessageContent.self, forKey: .inputMessageContent)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.videoFileId = try container.decode(String.self, forKey: .videoFileId)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("id", object: self.id)
		encoder.append("video_file_id", object: self.videoFileId)
		encoder.append("title", object: self.title)
		encoder.append("description", object: self.description)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("reply_markup", object: self.replyMarkup)
		encoder.append("input_message_content", object: self.inputMessageContent)
	}
}
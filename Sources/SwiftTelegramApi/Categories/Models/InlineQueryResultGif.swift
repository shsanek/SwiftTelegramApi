import Foundation
public final class InlineQueryResultGif: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be gif
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///A valid URL for the GIF file. File size must not exceed 1MB
	public let gifUrl: String
	
	///Optional. Width of the GIF
	public let gifWidth: TelegramInteger?
	
	///Optional. Height of the GIF
	public let gifHeight: TelegramInteger?
	
	///Optional. Duration of the GIF in seconds
	public let gifDuration: TelegramInteger?
	
	///URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
	public let thumbnailUrl: String
	
	///Optional. MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”
	public let thumbnailMimeType: String?
	
	///Optional. Title for the result
	public let title: String?
	
	///Optional. Caption of the GIF file to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the GIF animation
	public let inputMessageContent: InputMessageContent?

	public init(
		type: String,
		id: String,
		gifUrl: String,
		gifWidth: TelegramInteger? = nil,
		gifHeight: TelegramInteger? = nil,
		gifDuration: TelegramInteger? = nil,
		thumbnailUrl: String,
		thumbnailMimeType: String? = nil,
		title: String? = nil,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil
	) {
		self.type = type
		self.id = id
		self.gifUrl = gifUrl
		self.gifWidth = gifWidth
		self.gifHeight = gifHeight
		self.gifDuration = gifDuration
		self.thumbnailUrl = thumbnailUrl
		self.thumbnailMimeType = thumbnailMimeType
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case gifUrl = "gif_url"
		case gifWidth = "gif_width"
		case gifHeight = "gif_height"
		case gifDuration = "gif_duration"
		case thumbnailUrl = "thumbnail_url"
		case thumbnailMimeType = "thumbnail_mime_type"
		case title
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
		try container.encode(self.gifUrl.self, forKey: .gifUrl)
		try container.encodeIfPresent(self.gifWidth.self, forKey: .gifWidth)
		try container.encodeIfPresent(self.gifHeight.self, forKey: .gifHeight)
		try container.encodeIfPresent(self.gifDuration.self, forKey: .gifDuration)
		try container.encode(self.thumbnailUrl.self, forKey: .thumbnailUrl)
		try container.encodeIfPresent(self.thumbnailMimeType.self, forKey: .thumbnailMimeType)
		try container.encodeIfPresent(self.title.self, forKey: .title)
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
		self.gifUrl = try container.decode(String.self, forKey: .gifUrl)
		self.gifWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .gifWidth)
		self.gifHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .gifHeight)
		self.gifDuration = try container.decodeIfPresent(TelegramInteger.self, forKey: .gifDuration)
		self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
		self.thumbnailMimeType = try container.decodeIfPresent(String.self, forKey: .thumbnailMimeType)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
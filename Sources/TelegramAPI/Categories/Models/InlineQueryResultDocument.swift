import Foundation
public final class InlineQueryResultDocument: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be document
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///Title for the result
	public let title: String
	
	///Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the document caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///A valid URL for the file
	public let documentUrl: String
	
	///MIME type of the content of the file, either “application/pdf” or “application/zip”
	public let mimeType: String
	
	///Optional. Short description of the result
	public let description: String?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the file
	public let inputMessageContent: InputMessageContent?
	
	///Optional. URL of the thumbnail (JPEG only) for the file
	public let thumbnailUrl: String?
	
	///Optional. Thumbnail width
	public let thumbnailWidth: TelegramInteger?
	
	///Optional. Thumbnail height
	public let thumbnailHeight: TelegramInteger?

	public init(
		type: String,
		id: String,
		title: String,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		documentUrl: String,
		mimeType: String,
		description: String? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil,
		thumbnailUrl: String? = nil,
		thumbnailWidth: TelegramInteger? = nil,
		thumbnailHeight: TelegramInteger? = nil
	) {
		self.type = type
		self.id = id
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.documentUrl = documentUrl
		self.mimeType = mimeType
		self.description = description
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbnailUrl = thumbnailUrl
		self.thumbnailWidth = thumbnailWidth
		self.thumbnailHeight = thumbnailHeight
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case title
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case documentUrl = "document_url"
		case mimeType = "mime_type"
		case description
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
		case thumbnailUrl = "thumbnail_url"
		case thumbnailWidth = "thumbnail_width"
		case thumbnailHeight = "thumbnail_height"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encode(self.documentUrl.self, forKey: .documentUrl)
		try container.encode(self.mimeType.self, forKey: .mimeType)
		try container.encodeIfPresent(self.description.self, forKey: .description)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.inputMessageContent.self, forKey: .inputMessageContent)
		try container.encodeIfPresent(self.thumbnailUrl.self, forKey: .thumbnailUrl)
		try container.encodeIfPresent(self.thumbnailWidth.self, forKey: .thumbnailWidth)
		try container.encodeIfPresent(self.thumbnailHeight.self, forKey: .thumbnailHeight)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.title = try container.decode(String.self, forKey: .title)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.documentUrl = try container.decode(String.self, forKey: .documentUrl)
		self.mimeType = try container.decode(String.self, forKey: .mimeType)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
		self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		self.thumbnailWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailWidth)
		self.thumbnailHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailHeight)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
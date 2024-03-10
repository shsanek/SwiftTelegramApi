import Foundation
public final class InlineQueryResultVideo: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be video
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///A valid URL for the embedded video player or video file
	public let videoUrl: String
	
	///MIME type of the content of the video URL, “text/html” or “video/mp4”
	public let mimeType: String
	
	///URL of the thumbnail (JPEG only) for the video
	public let thumbnailUrl: String
	
	///Title for the result
	public let title: String
	
	///Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the video caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Video width
	public let videoWidth: TelegramInteger?
	
	///Optional. Video height
	public let videoHeight: TelegramInteger?
	
	///Optional. Video duration in seconds
	public let videoDuration: TelegramInteger?
	
	///Optional. Short description of the result
	public let description: String?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
	public let inputMessageContent: InputMessageContent?

	public init(
		type: String,
		id: String,
		videoUrl: String,
		mimeType: String,
		thumbnailUrl: String,
		title: String,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		videoWidth: TelegramInteger? = nil,
		videoHeight: TelegramInteger? = nil,
		videoDuration: TelegramInteger? = nil,
		description: String? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil
	) {
		self.type = type
		self.id = id
		self.videoUrl = videoUrl
		self.mimeType = mimeType
		self.thumbnailUrl = thumbnailUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.videoWidth = videoWidth
		self.videoHeight = videoHeight
		self.videoDuration = videoDuration
		self.description = description
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case videoUrl = "video_url"
		case mimeType = "mime_type"
		case thumbnailUrl = "thumbnail_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case videoWidth = "video_width"
		case videoHeight = "video_height"
		case videoDuration = "video_duration"
		case description
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.videoUrl.self, forKey: .videoUrl)
		try container.encode(self.mimeType.self, forKey: .mimeType)
		try container.encode(self.thumbnailUrl.self, forKey: .thumbnailUrl)
		try container.encode(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.videoWidth.self, forKey: .videoWidth)
		try container.encodeIfPresent(self.videoHeight.self, forKey: .videoHeight)
		try container.encodeIfPresent(self.videoDuration.self, forKey: .videoDuration)
		try container.encodeIfPresent(self.description.self, forKey: .description)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.inputMessageContent.self, forKey: .inputMessageContent)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.videoUrl = try container.decode(String.self, forKey: .videoUrl)
		self.mimeType = try container.decode(String.self, forKey: .mimeType)
		self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
		self.title = try container.decode(String.self, forKey: .title)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.videoWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .videoWidth)
		self.videoHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .videoHeight)
		self.videoDuration = try container.decodeIfPresent(TelegramInteger.self, forKey: .videoDuration)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
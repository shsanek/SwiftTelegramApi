import Foundation
public final class InputMediaVideo: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be video
	public let type: String
	
	///File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
	public let media: String
	
	///Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
	public let thumbnail: TelegramInputFileContainer?
	
	///Optional. Caption of the video to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the video caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Video width
	public let width: TelegramInteger?
	
	///Optional. Video height
	public let height: TelegramInteger?
	
	///Optional. Video duration in seconds
	public let duration: TelegramInteger?
	
	///Optional. Pass True if the uploaded video is suitable for streaming
	public let supportsStreaming: Bool?
	
	///Optional. Pass True if the video needs to be covered with a spoiler animation
	public let hasSpoiler: Bool?

	public init(
		type: String,
		media: String,
		thumbnail: TelegramInputFileContainer? = nil,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		width: TelegramInteger? = nil,
		height: TelegramInteger? = nil,
		duration: TelegramInteger? = nil,
		supportsStreaming: Bool? = nil,
		hasSpoiler: Bool? = nil
	) {
		self.type = type
		self.media = media
		self.thumbnail = thumbnail
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.width = width
		self.height = height
		self.duration = duration
		self.supportsStreaming = supportsStreaming
		self.hasSpoiler = hasSpoiler
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case media
		case thumbnail
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case width
		case height
		case duration
		case supportsStreaming = "supports_streaming"
		case hasSpoiler = "has_spoiler"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.media.self, forKey: .media)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.width.self, forKey: .width)
		try container.encodeIfPresent(self.height.self, forKey: .height)
		try container.encodeIfPresent(self.duration.self, forKey: .duration)
		try container.encodeIfPresent(self.supportsStreaming.self, forKey: .supportsStreaming)
		try container.encodeIfPresent(self.hasSpoiler.self, forKey: .hasSpoiler)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.media = try container.decode(String.self, forKey: .media)
		self.thumbnail = try container.decodeIfPresent(TelegramInputFileContainer.self, forKey: .thumbnail)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.width = try container.decodeIfPresent(TelegramInteger.self, forKey: .width)
		self.height = try container.decodeIfPresent(TelegramInteger.self, forKey: .height)
		self.duration = try container.decodeIfPresent(TelegramInteger.self, forKey: .duration)
		self.supportsStreaming = try container.decodeIfPresent(Bool.self, forKey: .supportsStreaming)
		self.hasSpoiler = try container.decodeIfPresent(Bool.self, forKey: .hasSpoiler)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
public final class InputMediaAudio: Codable, IMultiPartFromDataEncodable {
	///Type of the result, must be audio
	public let type: String
	
	///File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
	public let media: String
	
	///Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
	public let thumbnail: TelegramInputFileContainer?
	
	///Optional. Caption of the audio to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the audio caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Duration of the audio in seconds
	public let duration: TelegramInteger?
	
	///Optional. Performer of the audio
	public let performer: String?
	
	///Optional. Title of the audio
	public let title: String?

	public init(
		type: String,
		media: String,
		thumbnail: TelegramInputFileContainer? = nil,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		duration: TelegramInteger? = nil,
		performer: String? = nil,
		title: String? = nil
	) {
		self.type = type
		self.media = media
		self.thumbnail = thumbnail
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.duration = duration
		self.performer = performer
		self.title = title
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case media
		case thumbnail
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case duration
		case performer
		case title
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.media.self, forKey: .media)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.duration.self, forKey: .duration)
		try container.encodeIfPresent(self.performer.self, forKey: .performer)
		try container.encodeIfPresent(self.title.self, forKey: .title)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.media = try container.decode(String.self, forKey: .media)
		self.thumbnail = try container.decodeIfPresent(TelegramInputFileContainer.self, forKey: .thumbnail)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.duration = try container.decodeIfPresent(TelegramInteger.self, forKey: .duration)
		self.performer = try container.decodeIfPresent(String.self, forKey: .performer)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("media", object: self.media)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("duration", object: self.duration)
		encoder.append("performer", object: self.performer)
		encoder.append("title", object: self.title)
	}
}
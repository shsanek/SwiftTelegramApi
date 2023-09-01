import Foundation
public final class InputMediaPhoto: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be photo
	public let type: String
	
	///File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More information on Sending Files »
	public let media: String
	
	///Optional. Caption of the photo to be sent, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the photo caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Pass True if the photo needs to be covered with a spoiler animation
	public let hasSpoiler: Bool?

	public init(
		type: String,
		media: String,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		hasSpoiler: Bool? = nil
	) {
		self.type = type
		self.media = media
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.hasSpoiler = hasSpoiler
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case media
		case caption
		case parseMode = "parse_mode"
		case captionEntities = "caption_entities"
		case hasSpoiler = "has_spoiler"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.media.self, forKey: .media)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.hasSpoiler.self, forKey: .hasSpoiler)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.media = try container.decode(String.self, forKey: .media)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.hasSpoiler = try container.decodeIfPresent(Bool.self, forKey: .hasSpoiler)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
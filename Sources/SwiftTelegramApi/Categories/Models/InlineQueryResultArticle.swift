import Foundation
public final class InlineQueryResultArticle: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be article
	public let type: String
	
	///Unique identifier for this result, 1-64 Bytes
	public let id: String
	
	///Title of the result
	public let title: String
	
	///Content of the message to be sent
	public let inputMessageContent: InputMessageContent
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. URL of the result
	public let url: String?
	
	///Optional. Pass True if you don't want the URL to be shown in the message
	public let hideUrl: Bool?
	
	///Optional. Short description of the result
	public let description: String?
	
	///Optional. Url of the thumbnail for the result
	public let thumbnailUrl: String?
	
	///Optional. Thumbnail width
	public let thumbnailWidth: TelegramInteger?
	
	///Optional. Thumbnail height
	public let thumbnailHeight: TelegramInteger?

	public init(
		type: String,
		id: String,
		title: String,
		inputMessageContent: InputMessageContent,
		replyMarkup: InlineKeyboardMarkup? = nil,
		url: String? = nil,
		hideUrl: Bool? = nil,
		description: String? = nil,
		thumbnailUrl: String? = nil,
		thumbnailWidth: TelegramInteger? = nil,
		thumbnailHeight: TelegramInteger? = nil
	) {
		self.type = type
		self.id = id
		self.title = title
		self.inputMessageContent = inputMessageContent
		self.replyMarkup = replyMarkup
		self.url = url
		self.hideUrl = hideUrl
		self.description = description
		self.thumbnailUrl = thumbnailUrl
		self.thumbnailWidth = thumbnailWidth
		self.thumbnailHeight = thumbnailHeight
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case title
		case inputMessageContent = "input_message_content"
		case replyMarkup = "reply_markup"
		case url
		case hideUrl = "hide_url"
		case description
		case thumbnailUrl = "thumbnail_url"
		case thumbnailWidth = "thumbnail_width"
		case thumbnailHeight = "thumbnail_height"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.inputMessageContent.self, forKey: .inputMessageContent)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.url.self, forKey: .url)
		try container.encodeIfPresent(self.hideUrl.self, forKey: .hideUrl)
		try container.encodeIfPresent(self.description.self, forKey: .description)
		try container.encodeIfPresent(self.thumbnailUrl.self, forKey: .thumbnailUrl)
		try container.encodeIfPresent(self.thumbnailWidth.self, forKey: .thumbnailWidth)
		try container.encodeIfPresent(self.thumbnailHeight.self, forKey: .thumbnailHeight)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.title = try container.decode(String.self, forKey: .title)
		self.inputMessageContent = try container.decode(InputMessageContent.self, forKey: .inputMessageContent)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.url = try container.decodeIfPresent(String.self, forKey: .url)
		self.hideUrl = try container.decodeIfPresent(Bool.self, forKey: .hideUrl)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		self.thumbnailWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailWidth)
		self.thumbnailHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailHeight)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
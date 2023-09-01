import Foundation
public final class InputTextMessageContent: Codable, IMultiPartFromDataValueEncodable {
	///Text of the message to be sent, 1-4096 characters
	public let messageText: String
	
	///Optional. Mode for parsing entities in the message text. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. List of special entities that appear in message text, which can be specified instead of parse_mode
	public let entities: [MessageEntity]?
	
	///Optional. Disables link previews for links in the sent message
	public let disableWebPagePreview: Bool?

	public init(
		messageText: String,
		parseMode: String? = nil,
		entities: [MessageEntity]? = nil,
		disableWebPagePreview: Bool? = nil
	) {
		self.messageText = messageText
		self.parseMode = parseMode
		self.entities = entities
		self.disableWebPagePreview = disableWebPagePreview
	}

	private enum CodingKeys: String, CodingKey {
		case messageText = "message_text"
		case parseMode = "parse_mode"
		case entities
		case disableWebPagePreview = "disable_web_page_preview"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.messageText.self, forKey: .messageText)
		try container.encodeIfPresent(self.parseMode.self, forKey: .parseMode)
		try container.encodeIfPresent(self.entities.self, forKey: .entities)
		try container.encodeIfPresent(self.disableWebPagePreview.self, forKey: .disableWebPagePreview)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.messageText = try container.decode(String.self, forKey: .messageText)
		self.parseMode = try container.decodeIfPresent(String.self, forKey: .parseMode)
		self.entities = try container.decodeIfPresent([MessageEntity].self, forKey: .entities)
		self.disableWebPagePreview = try container.decodeIfPresent(Bool.self, forKey: .disableWebPagePreview)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
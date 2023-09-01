import Foundation
public final class MessageEntity: Codable, IMultiPartFromDataValueEncodable {
	///Type of the entity. Currently, can be “mention” (@username), “hashtag” (#hashtag), “cashtag” ($USD), “bot_command” (/start@jobs_bot), “url” (https://telegram.org), “email” (do-not-reply@telegram.org), “phone_number” (+1-212-555-0123), “bold” (bold text), “italic” (italic text), “underline” (underlined text), “strikethrough” (strikethrough text), “spoiler” (spoiler message), “code” (monowidth string), “pre” (monowidth block), “text_link” (for clickable text URLs), “text_mention” (for users without usernames), “custom_emoji” (for inline custom emoji stickers)
	public let type: String
	
	///Offset in UTF-16 code units to the start of the entity
	public let offset: TelegramInteger
	
	///Length of the entity in UTF-16 code units
	public let length: TelegramInteger
	
	///Optional. For “text_link” only, URL that will be opened after user taps on the text
	public let url: String?
	
	///Optional. For “text_mention” only, the mentioned user
	public let user: User?
	
	///Optional. For “pre” only, the programming language of the entity text
	public let language: String?
	
	///Optional. For “custom_emoji” only, unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker
	public let customEmojiId: String?

	public init(
		type: String,
		offset: TelegramInteger,
		length: TelegramInteger,
		url: String? = nil,
		user: User? = nil,
		language: String? = nil,
		customEmojiId: String? = nil
	) {
		self.type = type
		self.offset = offset
		self.length = length
		self.url = url
		self.user = user
		self.language = language
		self.customEmojiId = customEmojiId
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case offset
		case length
		case url
		case user
		case language
		case customEmojiId = "custom_emoji_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.offset.self, forKey: .offset)
		try container.encode(self.length.self, forKey: .length)
		try container.encodeIfPresent(self.url.self, forKey: .url)
		try container.encodeIfPresent(self.user.self, forKey: .user)
		try container.encodeIfPresent(self.language.self, forKey: .language)
		try container.encodeIfPresent(self.customEmojiId.self, forKey: .customEmojiId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.offset = try container.decode(TelegramInteger.self, forKey: .offset)
		self.length = try container.decode(TelegramInteger.self, forKey: .length)
		self.url = try container.decodeIfPresent(String.self, forKey: .url)
		self.user = try container.decodeIfPresent(User.self, forKey: .user)
		self.language = try container.decodeIfPresent(String.self, forKey: .language)
		self.customEmojiId = try container.decodeIfPresent(String.self, forKey: .customEmojiId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class User: Codable, IMultiPartFromDataValueEncodable {
	///Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
	public let id: TelegramInteger
	
	///True, if this user is a bot
	public let isBot: Bool
	
	///User's or bot's first name
	public let firstName: String
	
	///Optional. User's or bot's last name
	public let lastName: String?
	
	///Optional. User's or bot's username
	public let username: String?
	
	///Optional. IETF language tag of the user's language
	public let languageCode: String?
	
	///Optional. True, if this user is a Telegram Premium user
	public let isPremium: Bool?
	
	///Optional. True, if this user added the bot to the attachment menu
	public let addedToAttachmentMenu: Bool?
	
	///Optional. True, if the bot can be invited to groups. Returned only in getMe.
	public let canJoinGroups: Bool?
	
	///Optional. True, if privacy mode is disabled for the bot. Returned only in getMe.
	public let canReadAllGroupMessages: Bool?
	
	///Optional. True, if the bot supports inline queries. Returned only in getMe.
	public let supportsInlineQueries: Bool?

	public init(
		id: TelegramInteger,
		isBot: Bool,
		firstName: String,
		lastName: String? = nil,
		username: String? = nil,
		languageCode: String? = nil,
		isPremium: Bool? = nil,
		addedToAttachmentMenu: Bool? = nil,
		canJoinGroups: Bool? = nil,
		canReadAllGroupMessages: Bool? = nil,
		supportsInlineQueries: Bool? = nil
	) {
		self.id = id
		self.isBot = isBot
		self.firstName = firstName
		self.lastName = lastName
		self.username = username
		self.languageCode = languageCode
		self.isPremium = isPremium
		self.addedToAttachmentMenu = addedToAttachmentMenu
		self.canJoinGroups = canJoinGroups
		self.canReadAllGroupMessages = canReadAllGroupMessages
		self.supportsInlineQueries = supportsInlineQueries
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case isBot = "is_bot"
		case firstName = "first_name"
		case lastName = "last_name"
		case username
		case languageCode = "language_code"
		case isPremium = "is_premium"
		case addedToAttachmentMenu = "added_to_attachment_menu"
		case canJoinGroups = "can_join_groups"
		case canReadAllGroupMessages = "can_read_all_group_messages"
		case supportsInlineQueries = "supports_inline_queries"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.isBot.self, forKey: .isBot)
		try container.encode(self.firstName.self, forKey: .firstName)
		try container.encodeIfPresent(self.lastName.self, forKey: .lastName)
		try container.encodeIfPresent(self.username.self, forKey: .username)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
		try container.encodeIfPresent(self.isPremium.self, forKey: .isPremium)
		try container.encodeIfPresent(self.addedToAttachmentMenu.self, forKey: .addedToAttachmentMenu)
		try container.encodeIfPresent(self.canJoinGroups.self, forKey: .canJoinGroups)
		try container.encodeIfPresent(self.canReadAllGroupMessages.self, forKey: .canReadAllGroupMessages)
		try container.encodeIfPresent(self.supportsInlineQueries.self, forKey: .supportsInlineQueries)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(TelegramInteger.self, forKey: .id)
		self.isBot = try container.decode(Bool.self, forKey: .isBot)
		self.firstName = try container.decode(String.self, forKey: .firstName)
		self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
		self.username = try container.decodeIfPresent(String.self, forKey: .username)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
		self.isPremium = try container.decodeIfPresent(Bool.self, forKey: .isPremium)
		self.addedToAttachmentMenu = try container.decodeIfPresent(Bool.self, forKey: .addedToAttachmentMenu)
		self.canJoinGroups = try container.decodeIfPresent(Bool.self, forKey: .canJoinGroups)
		self.canReadAllGroupMessages = try container.decodeIfPresent(Bool.self, forKey: .canReadAllGroupMessages)
		self.supportsInlineQueries = try container.decodeIfPresent(Bool.self, forKey: .supportsInlineQueries)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
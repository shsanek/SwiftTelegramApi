public final class InlineQueryResultContact: Codable, IMultiPartFromDataEncodable {
	///Type of the result, must be contact
	public let type: String
	
	///Unique identifier for this result, 1-64 Bytes
	public let id: String
	
	///Contact's phone number
	public let phoneNumber: String
	
	///Contact's first name
	public let firstName: String
	
	///Optional. Contact's last name
	public let lastName: String?
	
	///Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
	public let vcard: String?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the contact
	public let inputMessageContent: InputMessageContent?
	
	///Optional. Url of the thumbnail for the result
	public let thumbnailUrl: String?
	
	///Optional. Thumbnail width
	public let thumbnailWidth: TelegramInteger?
	
	///Optional. Thumbnail height
	public let thumbnailHeight: TelegramInteger?

	public init(
		type: String,
		id: String,
		phoneNumber: String,
		firstName: String,
		lastName: String? = nil,
		vcard: String? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil,
		thumbnailUrl: String? = nil,
		thumbnailWidth: TelegramInteger? = nil,
		thumbnailHeight: TelegramInteger? = nil
	) {
		self.type = type
		self.id = id
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.vcard = vcard
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbnailUrl = thumbnailUrl
		self.thumbnailWidth = thumbnailWidth
		self.thumbnailHeight = thumbnailHeight
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case vcard
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
		try container.encode(self.phoneNumber.self, forKey: .phoneNumber)
		try container.encode(self.firstName.self, forKey: .firstName)
		try container.encodeIfPresent(self.lastName.self, forKey: .lastName)
		try container.encodeIfPresent(self.vcard.self, forKey: .vcard)
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
		self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
		self.firstName = try container.decode(String.self, forKey: .firstName)
		self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
		self.vcard = try container.decodeIfPresent(String.self, forKey: .vcard)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
		self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		self.thumbnailWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailWidth)
		self.thumbnailHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailHeight)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("id", object: self.id)
		encoder.append("phone_number", object: self.phoneNumber)
		encoder.append("first_name", object: self.firstName)
		encoder.append("last_name", object: self.lastName)
		encoder.append("vcard", object: self.vcard)
		encoder.append("reply_markup", object: self.replyMarkup)
		encoder.append("input_message_content", object: self.inputMessageContent)
		encoder.append("thumbnail_url", object: self.thumbnailUrl)
		encoder.append("thumbnail_width", object: self.thumbnailWidth)
		encoder.append("thumbnail_height", object: self.thumbnailHeight)
	}
}
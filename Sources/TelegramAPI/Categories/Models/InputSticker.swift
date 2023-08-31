public final class InputSticker: Codable, IMultiPartFromDataEncodable {
	///The added sticker. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, upload a new one using multipart/form-data, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. Animated and video stickers can't be uploaded via HTTP URL. More information on Sending Files »
	public let sticker: TelegramInputFileContainer
	
	///List of 1-20 emoji associated with the sticker
	public let emojiList: [String]
	
	///Optional. Position where the mask should be placed on faces. For “mask” stickers only.
	public let maskPosition: MaskPosition?
	
	///Optional. List of 0-20 search keywords for the sticker with total length of up to 64 characters. For “regular” and “custom_emoji” stickers only.
	public let keywords: [String]?

	public init(
		sticker: TelegramInputFileContainer,
		emojiList: [String],
		maskPosition: MaskPosition? = nil,
		keywords: [String]? = nil
	) {
		self.sticker = sticker
		self.emojiList = emojiList
		self.maskPosition = maskPosition
		self.keywords = keywords
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case emojiList = "emoji_list"
		case maskPosition = "mask_position"
		case keywords
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encode(self.emojiList.self, forKey: .emojiList)
		try container.encodeIfPresent(self.maskPosition.self, forKey: .maskPosition)
		try container.encodeIfPresent(self.keywords.self, forKey: .keywords)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.sticker = try container.decode(TelegramInputFileContainer.self, forKey: .sticker)
		self.emojiList = try container.decode([String].self, forKey: .emojiList)
		self.maskPosition = try container.decodeIfPresent(MaskPosition.self, forKey: .maskPosition)
		self.keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("sticker", object: self.sticker)
		encoder.append("emoji_list", object: self.emojiList)
		encoder.append("mask_position", object: self.maskPosition)
		encoder.append("keywords", object: self.keywords)
	}
}
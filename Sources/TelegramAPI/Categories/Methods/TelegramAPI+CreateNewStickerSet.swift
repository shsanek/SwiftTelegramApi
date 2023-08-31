extension TelegramAPI {
    /// Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success.
    public func createNewStickerSet(_ input: CreateNewStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("createNewStickerSet", object: input, completion: completionHandler)
    }
}

//Input model for request createNewStickerSet
public final class CreateNewStickerSetInput: Encodable {
	///Yes. User identifier of created sticker set owner
	public let userId: TelegramInteger
	
	///Yes. Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only English letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in "_by_<bot_username>". <bot_username> is case insensitive. 1-64 characters.
	public let name: String
	
	///Yes. Sticker set title, 1-64 characters
	public let title: String
	
	///Yes. A JSON-serialized list of 1-50 initial stickers to be added to the sticker set
	public let stickers: [InputSticker]
	
	///Yes. Format of stickers in the set, must be one of “static”, “animated”, “video”
	public let stickerFormat: String
	
	///Optional. Type of stickers in the set, pass “regular”, “mask”, or “custom_emoji”. By default, a regular sticker set is created.
	public let stickerType: String?
	
	///Optional. Pass True if stickers in the sticker set must be repainted to the color of text when used in messages, the accent color if used as emoji status, white on chat photos, or another appropriate color based on context; for custom emoji sticker sets only
	public let needsRepainting: Bool?

	public init(
		userId: TelegramInteger,
		name: String,
		title: String,
		stickers: [InputSticker],
		stickerFormat: String,
		stickerType: String? = nil,
		needsRepainting: Bool? = nil
	) {
		self.userId = userId
		self.name = name
		self.title = title
		self.stickers = stickers
		self.stickerFormat = stickerFormat
		self.stickerType = stickerType
		self.needsRepainting = needsRepainting
	}

	private enum CodingKeys: String, CodingKey {
		case userId = "user_id"
		case name
		case title
		case stickers
		case stickerFormat = "sticker_format"
		case stickerType = "sticker_type"
		case needsRepainting = "needs_repainting"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.stickers.self, forKey: .stickers)
		try container.encode(self.stickerFormat.self, forKey: .stickerFormat)
		try container.encodeIfPresent(self.stickerType.self, forKey: .stickerType)
		try container.encodeIfPresent(self.needsRepainting.self, forKey: .needsRepainting)
	}
}
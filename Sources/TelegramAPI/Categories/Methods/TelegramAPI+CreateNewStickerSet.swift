extension TelegramAPI {
    /// Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success.
    public func createNewStickerSet(_ input: CreateNewStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("createNewStickerSet", object: input, completion: completionHandler)
    }
}

//Input model for request createNewStickerSet
public final class CreateNewStickerSetInput: Encodable {
	///Yes
	public let userId: TelegramInteger
	
	///Yes
	public let name: String
	
	///Yes
	public let title: String
	
	///Yes
	public let stickers: [InputSticker]
	
	///Yes
	public let stickerFormat: String
	
	///Optional
	public let stickerType: String
	
	///Optional
	public let needsRepainting: Bool

	public init(
		userId: TelegramInteger,
		name: String,
		title: String,
		stickers: [InputSticker],
		stickerFormat: String,
		stickerType: String,
		needsRepainting: Bool
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
		try container.encode(self.stickerType.self, forKey: .stickerType)
		try container.encode(self.needsRepainting.self, forKey: .needsRepainting)
	}
}
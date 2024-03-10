import Foundation

extension TelegramAPI {
    /// Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. Returns True on success.
    public func createNewStickerSet(_ input: CreateNewStickerSetInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("createNewStickerSet", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func createNewStickerSet(_ input: CreateNewStickerSetInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("createNewStickerSet", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request createNewStickerSet
public final class CreateNewStickerSetInput: IMultiPartFromDataEncodable {
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("user_id", object: self.userId)
		try encoder.append("name", object: self.name)
		try encoder.append("title", object: self.title)
		try encoder.append("stickers", object: self.stickers)
		try encoder.append("sticker_format", object: self.stickerFormat)
		try encoder.append("sticker_type", object: self.stickerType)
		try encoder.append("needs_repainting", object: self.needsRepainting)
	}
}
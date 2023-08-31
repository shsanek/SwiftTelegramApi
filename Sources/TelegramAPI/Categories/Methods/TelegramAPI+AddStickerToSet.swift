extension TelegramAPI {
    /// Use this method to add a new sticker to a set created by the bot. The format of the added sticker must match the format of the other stickers in the set. Emoji sticker sets can have up to 200 stickers. Animated and video sticker sets can have up to 50 stickers. Static sticker sets can have up to 120 stickers. Returns True on success.
    public func addStickerToSet(_ input: AddStickerToSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("addStickerToSet", object: input, completion: completionHandler)
    }
}

//Input model for request addStickerToSet
public final class AddStickerToSetInput: IMultiPartFromDataEncodable {
	///Yes. User identifier of sticker set owner
	public let userId: TelegramInteger
	
	///Yes. Sticker set name
	public let name: String
	
	///Yes. A JSON-serialized object with information about the added sticker. If exactly the same sticker had already been added to the set, then the set isn't changed.
	public let sticker: InputSticker

	public init(
		userId: TelegramInteger,
		name: String,
		sticker: InputSticker
	) {
		self.userId = userId
		self.name = name
		self.sticker = sticker
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("user_id", object: self.userId)
		encoder.append("name", object: self.name)
		encoder.append("sticker", object: self.sticker)
	}
}
extension TelegramAPI {
    /// Use this method to delete a sticker from a set created by the bot. Returns True on success.
    public func deleteStickerFromSet(_ input: DeleteStickerFromSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteStickerFromSet", object: input, completion: completionHandler)
    }
}

//Input model for request deleteStickerFromSet
public final class DeleteStickerFromSetInput: Encodable {
	///Yes
	public let sticker: String

	public init(
		sticker: String
	) {
		self.sticker = sticker
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
	}
}
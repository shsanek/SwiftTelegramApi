extension TelegramAPI {
    /// Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.
    public func setStickerPositionInSet(_ input: SetStickerPositionInSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerPositionInSet", object: input, completion: completionHandler)
    }
}

//Input model for request setStickerPositionInSet
public final class SetStickerPositionInSetInput: Encodable {
	///Yes. File identifier of the sticker
	public let sticker: String
	
	///Yes. New sticker position in the set, zero-based
	public let position: TelegramInteger

	public init(
		sticker: String,
		position: TelegramInteger
	) {
		self.sticker = sticker
		self.position = position
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case position
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encode(self.position.self, forKey: .position)
	}
}
extension TelegramAPI {
    /// Use this method to change the mask position of a mask sticker. The sticker must belong to a sticker set that was created by the bot. Returns True on success.
    public func setStickerMaskPosition(_ input: SetStickerMaskPositionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerMaskPosition", object: input, completion: completionHandler)
    }
}

//Input model for request setStickerMaskPosition
public final class SetStickerMaskPositionInput: Encodable {
	///Yes
	public let sticker: String
	
	///Optional
	public let maskPosition: MaskPosition

	public init(
		sticker: String,
		maskPosition: MaskPosition
	) {
		self.sticker = sticker
		self.maskPosition = maskPosition
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case maskPosition = "mask_position"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encode(self.maskPosition.self, forKey: .maskPosition)
	}
}
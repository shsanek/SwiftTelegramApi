extension TelegramAPI {
    /// Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success.
    public func setCustomEmojiStickerSetThumbnail(_ input: SetCustomEmojiStickerSetThumbnailInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setCustomEmojiStickerSetThumbnail", object: input, completion: completionHandler)
    }
}

//Input model for request setCustomEmojiStickerSetThumbnail
public final class SetCustomEmojiStickerSetThumbnailInput: Encodable {
	///Yes
	public let name: String
	
	///Optional
	public let customEmojiId: String

	public init(
		name: String,
		customEmojiId: String
	) {
		self.name = name
		self.customEmojiId = customEmojiId
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case customEmojiId = "custom_emoji_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.customEmojiId.self, forKey: .customEmojiId)
	}
}
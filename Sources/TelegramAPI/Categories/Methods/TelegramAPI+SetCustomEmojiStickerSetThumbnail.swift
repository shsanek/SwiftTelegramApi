extension TelegramAPI {
    /// Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success.
    public func setCustomEmojiStickerSetThumbnail(_ input: SetCustomEmojiStickerSetThumbnailInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setCustomEmojiStickerSetThumbnail", object: input, completion: completionHandler)
    }
}

//Input model for request setCustomEmojiStickerSetThumbnail
public final class SetCustomEmojiStickerSetThumbnailInput: Encodable {
	///Yes. Sticker set name
	public let name: String
	
	///Optional. Custom emoji identifier of a sticker from the sticker set; pass an empty string to drop the thumbnail and use the first sticker as the thumbnail.
	public let customEmojiId: String?

	public init(
		name: String,
		customEmojiId: String? = nil
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
		try container.encodeIfPresent(self.customEmojiId.self, forKey: .customEmojiId)
	}
}
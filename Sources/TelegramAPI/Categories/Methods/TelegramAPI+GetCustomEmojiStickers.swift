extension TelegramAPI {
    /// Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.
    public func getCustomEmojiStickers(_ input: GetCustomEmojiStickersInput, completionHandler: @escaping (TelegramResult<[Sticker]>) -> Void) {
        self.requester.request("getCustomEmojiStickers", object: input, completion: completionHandler)
    }
}

//Input model for request getCustomEmojiStickers
public final class GetCustomEmojiStickersInput: Encodable {
	///Yes
	public let customEmojiIds: [String]

	public init(
		customEmojiIds: [String]
	) {
		self.customEmojiIds = customEmojiIds
	}

	private enum CodingKeys: String, CodingKey {
		case customEmojiIds = "custom_emoji_ids"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.customEmojiIds.self, forKey: .customEmojiIds)
	}
}
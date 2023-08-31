extension TelegramAPI {
    /// Use this method to change the list of emoji assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.
    public func setStickerEmojiList(_ input: SetStickerEmojiListInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerEmojiList", object: input, completion: completionHandler)
    }
}

//Input model for request setStickerEmojiList
public final class SetStickerEmojiListInput: Encodable {
	///Yes. File identifier of the sticker
	public let sticker: String
	
	///Yes. A JSON-serialized list of 1-20 emoji associated with the sticker
	public let emojiList: [String]

	public init(
		sticker: String,
		emojiList: [String]
	) {
		self.sticker = sticker
		self.emojiList = emojiList
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case emojiList = "emoji_list"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encode(self.emojiList.self, forKey: .emojiList)
	}
}
extension TelegramAPI {
    /// Use this method to delete a sticker set that was created by the bot. Returns True on success.
    public func deleteStickerSet(_ input: DeleteStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteStickerSet", object: input, completion: completionHandler)
    }
}

//Input model for request deleteStickerSet
public final class DeleteStickerSetInput: Encodable {
	///Yes. Sticker set name
	public let name: String

	public init(
		name: String
	) {
		self.name = name
	}

	private enum CodingKeys: String, CodingKey {
		case name
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
	}
}
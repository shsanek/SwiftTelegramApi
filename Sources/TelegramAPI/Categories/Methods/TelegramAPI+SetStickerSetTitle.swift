extension TelegramAPI {
    /// Use this method to set the title of a created sticker set. Returns True on success.
    public func setStickerSetTitle(_ input: SetStickerSetTitleInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerSetTitle", object: input, completion: completionHandler)
    }
}

//Input model for request setStickerSetTitle
public final class SetStickerSetTitleInput: Encodable {
	///Yes. Sticker set name
	public let name: String
	
	///Yes. Sticker set title, 1-64 characters
	public let title: String

	public init(
		name: String,
		title: String
	) {
		self.name = name
		self.title = title
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case title
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.title.self, forKey: .title)
	}
}
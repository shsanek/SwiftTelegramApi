extension TelegramAPI {
    /// Use this method to set the thumbnail of a regular or mask sticker set. The format of the thumbnail file must match the format of the stickers in the set. Returns True on success.
    public func setStickerSetThumbnail(_ input: SetStickerSetThumbnailInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerSetThumbnail", object: input, completion: completionHandler)
    }
}

//Input model for request setStickerSetThumbnail
public final class SetStickerSetThumbnailInput: Encodable {
	///Yes
	public let name: String
	
	///Yes
	public let userId: TelegramInteger
	
	///Optional
	public let thumbnail: TelegramInputFileContainer

	public init(
		name: String,
		userId: TelegramInteger,
		thumbnail: TelegramInputFileContainer
	) {
		self.name = name
		self.userId = userId
		self.thumbnail = thumbnail
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case userId = "user_id"
		case thumbnail
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encode(self.thumbnail.self, forKey: .thumbnail)
	}
}
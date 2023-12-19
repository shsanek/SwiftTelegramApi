import Foundation

extension TelegramAPI {
    /// Use this method to set the thumbnail of a custom emoji sticker set. Returns True on success.
    public func setCustomEmojiStickerSetThumbnail(_ input: SetCustomEmojiStickerSetThumbnailInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setCustomEmojiStickerSetThumbnail", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request setCustomEmojiStickerSetThumbnail
import Foundation
public final class SetCustomEmojiStickerSetThumbnailInput: Codable, IMultiPartFromDataValueEncodable {
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
		self.customEmojiId = try container.decodeIfPresent(String.self, forKey: .customEmojiId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
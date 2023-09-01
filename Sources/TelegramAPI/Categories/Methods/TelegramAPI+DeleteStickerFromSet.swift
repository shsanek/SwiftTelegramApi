extension TelegramAPI {
    /// Use this method to delete a sticker from a set created by the bot. Returns True on success.
    public func deleteStickerFromSet(_ input: DeleteStickerFromSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteStickerFromSet", object: input, completion: completionHandler)
    }
}

//Input model for request deleteStickerFromSet
import Foundation
public final class DeleteStickerFromSetInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. File identifier of the sticker
	public let sticker: String

	public init(
		sticker: String
	) {
		self.sticker = sticker
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.sticker = try container.decode(String.self, forKey: .sticker)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
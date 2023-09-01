extension TelegramAPI {
    /// Use this method to get a sticker set. On success, a StickerSet object is returned.
    public func getStickerSet(_ input: GetStickerSetInput, completionHandler: @escaping (TelegramResult<StickerSet>) -> Void) {
        self.requester.request("getStickerSet", object: input, completion: completionHandler)
    }
}

//Input model for request getStickerSet
import Foundation
public final class GetStickerSetInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Name of the sticker set
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to get a sticker set. On success, a StickerSet object is returned.
    public func getStickerSet(_ input: GetStickerSetInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<StickerSet>) -> Void) {
        self.requester.request("getStickerSet", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func getStickerSet(_ input: GetStickerSetInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> StickerSet {
        try await self.requester.request("getStickerSet", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
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
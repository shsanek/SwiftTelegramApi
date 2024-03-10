import Foundation

extension TelegramAPI {
    /// Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.
    public func getCustomEmojiStickers(_ input: GetCustomEmojiStickersInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<[Sticker]>) -> Void) {
        self.requester.request("getCustomEmojiStickers", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getCustomEmojiStickers(_ input: GetCustomEmojiStickersInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> [Sticker] {
        try await self.requester.request("getCustomEmojiStickers", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getCustomEmojiStickers
import Foundation
public final class GetCustomEmojiStickersInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. List of custom emoji identifiers. At most 200 custom emoji identifiers can be specified.
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.customEmojiIds = try container.decode([String].self, forKey: .customEmojiIds)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to change search keywords assigned to a regular or custom emoji sticker. The sticker must belong to a sticker set created by the bot. Returns True on success.
    public func setStickerKeywords(_ input: SetStickerKeywordsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerKeywords", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func setStickerKeywords(_ input: SetStickerKeywordsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setStickerKeywords", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setStickerKeywords
import Foundation
public final class SetStickerKeywordsInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. File identifier of the sticker
	public let sticker: String
	
	///Optional. A JSON-serialized list of 0-20 search keywords for the sticker with total length of up to 64 characters
	public let keywords: [String]?

	public init(
		sticker: String,
		keywords: [String]? = nil
	) {
		self.sticker = sticker
		self.keywords = keywords
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case keywords
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encodeIfPresent(self.keywords.self, forKey: .keywords)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.sticker = try container.decode(String.self, forKey: .sticker)
		self.keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.
    public func setStickerPositionInSet(_ input: SetStickerPositionInSetInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerPositionInSet", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func setStickerPositionInSet(_ input: SetStickerPositionInSetInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setStickerPositionInSet", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setStickerPositionInSet
import Foundation
public final class SetStickerPositionInSetInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. File identifier of the sticker
	public let sticker: String
	
	///Yes. New sticker position in the set, zero-based
	public let position: TelegramInteger

	public init(
		sticker: String,
		position: TelegramInteger
	) {
		self.sticker = sticker
		self.position = position
	}

	private enum CodingKeys: String, CodingKey {
		case sticker
		case position
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.sticker.self, forKey: .sticker)
		try container.encode(self.position.self, forKey: .position)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.sticker = try container.decode(String.self, forKey: .sticker)
		self.position = try container.decode(TelegramInteger.self, forKey: .position)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
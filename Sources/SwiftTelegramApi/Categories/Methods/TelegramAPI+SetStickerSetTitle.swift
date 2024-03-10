import Foundation

extension TelegramAPI {
    /// Use this method to set the title of a created sticker set. Returns True on success.
    public func setStickerSetTitle(_ input: SetStickerSetTitleInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setStickerSetTitle", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func setStickerSetTitle(_ input: SetStickerSetTitleInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setStickerSetTitle", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setStickerSetTitle
import Foundation
public final class SetStickerSetTitleInput: Codable, IMultiPartFromDataValueEncodable {
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
		self.title = try container.decode(String.self, forKey: .title)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
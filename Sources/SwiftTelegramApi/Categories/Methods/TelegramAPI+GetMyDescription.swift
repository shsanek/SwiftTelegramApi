import Foundation

extension TelegramAPI {
    /// Use this method to get the current bot description for the given user language. Returns BotDescription on success.
    public func getMyDescription(_ input: GetMyDescriptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<BotDescription>) -> Void) {
        self.requester.request("getMyDescription", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func getMyDescription(_ input: GetMyDescriptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> BotDescription {
        try await self.requester.request("getMyDescription", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getMyDescription
import Foundation
public final class GetMyDescriptionInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. A two-letter ISO 639-1 language code or an empty string
	public let languageCode: String?

	public init(
		languageCode: String? = nil
	) {
		self.languageCode = languageCode
	}

	private enum CodingKeys: String, CodingKey {
		case languageCode = "language_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success.
    public func setMyDescription(_ input: SetMyDescriptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyDescription", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func setMyDescription(_ input: SetMyDescriptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setMyDescription", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setMyDescription
import Foundation
public final class SetMyDescriptionInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. New bot description; 0-512 characters. Pass an empty string to remove the dedicated description for the given language.
	public let description: String?
	
	///Optional. A two-letter ISO 639-1 language code. If empty, the description will be applied to all users for whose language there is no dedicated description.
	public let languageCode: String?

	public init(
		description: String? = nil,
		languageCode: String? = nil
	) {
		self.description = description
		self.languageCode = languageCode
	}

	private enum CodingKeys: String, CodingKey {
		case description
		case languageCode = "language_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.description.self, forKey: .description)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
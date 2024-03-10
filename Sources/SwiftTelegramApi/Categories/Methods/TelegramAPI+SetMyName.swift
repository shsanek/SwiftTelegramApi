import Foundation

extension TelegramAPI {
    /// Use this method to change the bot's name. Returns True on success.
    public func setMyName(_ input: SetMyNameInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyName", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func setMyName(_ input: SetMyNameInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setMyName", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setMyName
import Foundation
public final class SetMyNameInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. New bot name; 0-64 characters. Pass an empty string to remove the dedicated name for the given language.
	public let name: String?
	
	///Optional. A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose language there is no dedicated name.
	public let languageCode: String?

	public init(
		name: String? = nil,
		languageCode: String? = nil
	) {
		self.name = name
		self.languageCode = languageCode
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case languageCode = "language_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.name.self, forKey: .name)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
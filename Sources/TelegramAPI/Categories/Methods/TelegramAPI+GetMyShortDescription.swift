import Foundation

extension TelegramAPI {
    /// Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success.
    public func getMyShortDescription(_ input: GetMyShortDescriptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<BotShortDescription>) -> Void) {
        self.requester.request("getMyShortDescription", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request getMyShortDescription
import Foundation
public final class GetMyShortDescriptionInput: Codable, IMultiPartFromDataValueEncodable {
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
extension TelegramAPI {
    /// Use this method to change the bot's short description, which is shown on the bot's profile page and is sent together with the link when users share the bot. Returns True on success.
    public func setMyShortDescription(_ input: SetMyShortDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyShortDescription", object: input, completion: completionHandler)
    }
}

//Input model for request setMyShortDescription
import Foundation
public final class SetMyShortDescriptionInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. New short description for the bot; 0-120 characters. Pass an empty string to remove the dedicated short description for the given language.
	public let shortDescription: String?
	
	///Optional. A two-letter ISO 639-1 language code. If empty, the short description will be applied to all users for whose language there is no dedicated short description.
	public let languageCode: String?

	public init(
		shortDescription: String? = nil,
		languageCode: String? = nil
	) {
		self.shortDescription = shortDescription
		self.languageCode = languageCode
	}

	private enum CodingKeys: String, CodingKey {
		case shortDescription = "short_description"
		case languageCode = "language_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.shortDescription.self, forKey: .shortDescription)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
extension TelegramAPI {
    /// Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success.
    public func setMyDescription(_ input: SetMyDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyDescription", object: input, completion: completionHandler)
    }
}

//Input model for request setMyDescription
public final class SetMyDescriptionInput: Encodable {
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
}
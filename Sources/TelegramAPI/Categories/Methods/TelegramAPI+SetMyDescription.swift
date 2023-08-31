extension TelegramAPI {
    /// Use this method to change the bot's description, which is shown in the chat with the bot if the chat is empty. Returns True on success.
    public func setMyDescription(_ input: SetMyDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyDescription", object: input, completion: completionHandler)
    }
}

//Input model for request setMyDescription
public final class SetMyDescriptionInput: Encodable {
	///Optional
	public let description: String?
	
	///Optional
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
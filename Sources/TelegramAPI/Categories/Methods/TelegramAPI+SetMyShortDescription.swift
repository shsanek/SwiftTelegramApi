extension TelegramAPI {
    /// Use this method to change the bot's short description, which is shown on the bot's profile page and is sent together with the link when users share the bot. Returns True on success.
    public func setMyShortDescription(_ input: SetMyShortDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyShortDescription", object: input, completion: completionHandler)
    }
}

//Input model for request setMyShortDescription
public final class SetMyShortDescriptionInput: Encodable {
	///Optional
	public let shortDescription: String?
	
	///Optional
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
}
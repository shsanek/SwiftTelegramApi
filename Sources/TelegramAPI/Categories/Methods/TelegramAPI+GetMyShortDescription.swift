extension TelegramAPI {
    /// Use this method to get the current bot short description for the given user language. Returns BotShortDescription on success.
    public func getMyShortDescription(_ input: GetMyShortDescriptionInput, completionHandler: @escaping (TelegramResult<BotShortDescription>) -> Void) {
        self.requester.request("getMyShortDescription", object: input, completion: completionHandler)
    }
}

//Input model for request getMyShortDescription
public final class GetMyShortDescriptionInput: Encodable {
	///Optional
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
}
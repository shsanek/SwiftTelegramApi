extension TelegramAPI {
    /// Use this method to get the current bot description for the given user language. Returns BotDescription on success.
    public func getMyDescription(_ input: GetMyDescriptionInput, completionHandler: @escaping (TelegramResult<BotDescription>) -> Void) {
        self.requester.request("getMyDescription", object: input, completion: completionHandler)
    }
}

//Input model for request getMyDescription
public final class GetMyDescriptionInput: Encodable {
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
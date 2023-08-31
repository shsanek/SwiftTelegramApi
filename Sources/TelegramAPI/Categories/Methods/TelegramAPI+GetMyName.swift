extension TelegramAPI {
    /// Use this method to get the current bot name for the given user language. Returns BotName on success.
    public func getMyName(_ input: GetMyNameInput, completionHandler: @escaping (TelegramResult<BotName>) -> Void) {
        self.requester.request("getMyName", object: input, completion: completionHandler)
    }
}

//Input model for request getMyName
public final class GetMyNameInput: Encodable {
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
}
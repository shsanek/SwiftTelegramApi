extension TelegramAPI {
    /// Use this method to change the bot's name. Returns True on success.
    public func setMyName(_ input: SetMyNameInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyName", object: input, completion: completionHandler)
    }
}

//Input model for request setMyName
public final class SetMyNameInput: Encodable {
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
}
extension TelegramAPI {
    /// Use this method to change the bot's name. Returns True on success.
    public func setMyName(_ input: SetMyNameInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyName", object: input, completion: completionHandler)
    }
}

//Input model for request setMyName
public final class SetMyNameInput: Encodable {
	///Optional
	public let name: String
	
	///Optional
	public let languageCode: String

	public init(
		name: String,
		languageCode: String
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
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.languageCode.self, forKey: .languageCode)
	}
}
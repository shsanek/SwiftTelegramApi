extension TelegramAPI {
    /// Use this method to get the current list of the bot's commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned.
    public func getMyCommands(_ input: GetMyCommandsInput, completionHandler: @escaping (TelegramResult<[BotCommand]>) -> Void) {
        self.requester.request("getMyCommands", object: input, completion: completionHandler)
    }
}

//Input model for request getMyCommands
public final class GetMyCommandsInput: Encodable {
	///Optional. A JSON-serialized object, describing scope of users. Defaults to BotCommandScopeDefault.
	public let scope: BotCommandScope?
	
	///Optional. A two-letter ISO 639-1 language code or an empty string
	public let languageCode: String?

	public init(
		scope: BotCommandScope? = nil,
		languageCode: String? = nil
	) {
		self.scope = scope
		self.languageCode = languageCode
	}

	private enum CodingKeys: String, CodingKey {
		case scope
		case languageCode = "language_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.scope.self, forKey: .scope)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
	}
}
extension TelegramAPI {
    /// Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.
    public func deleteMyCommands(_ input: DeleteMyCommandsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteMyCommands", object: input, completion: completionHandler)
    }
}

//Input model for request deleteMyCommands
public final class DeleteMyCommandsInput: Encodable {
	///Optional
	public let scope: BotCommandScope
	
	///Optional
	public let languageCode: String

	public init(
		scope: BotCommandScope,
		languageCode: String
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
		try container.encode(self.scope.self, forKey: .scope)
		try container.encode(self.languageCode.self, forKey: .languageCode)
	}
}
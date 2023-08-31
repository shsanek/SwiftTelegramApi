extension TelegramAPI {
    /// Use this method to change the list of the bot's commands. See this manual for more details about bot commands. Returns True on success.
    public func setMyCommands(_ input: SetMyCommandsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyCommands", object: input, completion: completionHandler)
    }
}

//Input model for request setMyCommands
public final class SetMyCommandsInput: Encodable {
	///Yes
	public let commands: [BotCommand]
	
	///Optional
	public let scope: BotCommandScope?
	
	///Optional
	public let languageCode: String?

	public init(
		commands: [BotCommand],
		scope: BotCommandScope? = nil,
		languageCode: String? = nil
	) {
		self.commands = commands
		self.scope = scope
		self.languageCode = languageCode
	}

	private enum CodingKeys: String, CodingKey {
		case commands
		case scope
		case languageCode = "language_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.commands.self, forKey: .commands)
		try container.encodeIfPresent(self.scope.self, forKey: .scope)
		try container.encodeIfPresent(self.languageCode.self, forKey: .languageCode)
	}
}
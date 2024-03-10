import Foundation

extension TelegramAPI {
    /// Use this method to change the list of the bot's commands. See this manual for more details about bot commands. Returns True on success.
    public func setMyCommands(_ input: SetMyCommandsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyCommands", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func setMyCommands(_ input: SetMyCommandsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setMyCommands", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setMyCommands
import Foundation
public final class SetMyCommandsInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. A JSON-serialized list of bot commands to be set as the list of the bot's commands. At most 100 commands can be specified.
	public let commands: [BotCommand]
	
	///Optional. A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
	public let scope: BotCommandScope?
	
	///Optional. A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.commands = try container.decode([BotCommand].self, forKey: .commands)
		self.scope = try container.decodeIfPresent(BotCommandScope.self, forKey: .scope)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
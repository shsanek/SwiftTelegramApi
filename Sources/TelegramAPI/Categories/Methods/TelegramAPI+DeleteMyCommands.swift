extension TelegramAPI {
    /// Use this method to delete the list of the bot's commands for the given scope and user language. After deletion, higher level commands will be shown to affected users. Returns True on success.
    public func deleteMyCommands(_ input: DeleteMyCommandsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteMyCommands", object: input, completion: completionHandler)
    }
}

//Input model for request deleteMyCommands
import Foundation
public final class DeleteMyCommandsInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
	public let scope: BotCommandScope?
	
	///Optional. A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.scope = try container.decodeIfPresent(BotCommandScope.self, forKey: .scope)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
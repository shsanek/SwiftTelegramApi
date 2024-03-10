import Foundation

extension TelegramAPI {
    /// Use this method to get the current list of the bot's commands for the given scope and user language. Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned.
    public func getMyCommands(_ input: GetMyCommandsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<[BotCommand]>) -> Void) {
        self.requester.request("getMyCommands", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getMyCommands(_ input: GetMyCommandsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> [BotCommand] {
        try await self.requester.request("getMyCommands", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getMyCommands
import Foundation
public final class GetMyCommandsInput: Codable, IMultiPartFromDataValueEncodable {
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.scope = try container.decodeIfPresent(BotCommandScope.self, forKey: .scope)
		self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
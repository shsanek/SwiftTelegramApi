import Foundation

extension TelegramAPI {
    /// Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success.
    public func setChatMenuButton(_ input: SetChatMenuButtonInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatMenuButton", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func setChatMenuButton(_ input: SetChatMenuButtonInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setChatMenuButton", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setChatMenuButton
import Foundation
public final class SetChatMenuButtonInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. Unique identifier for the target private chat. If not specified, default bot's menu button will be changed
	public let chatId: TelegramInteger?
	
	///Optional. A JSON-serialized object for the bot's new menu button. Defaults to MenuButtonDefault
	public let menuButton: MenuButton?

	public init(
		chatId: TelegramInteger? = nil,
		menuButton: MenuButton? = nil
	) {
		self.chatId = chatId
		self.menuButton = menuButton
	}

	private enum CodingKeys: String, CodingKey {
		case chatId = "chat_id"
		case menuButton = "menu_button"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.chatId.self, forKey: .chatId)
		try container.encodeIfPresent(self.menuButton.self, forKey: .menuButton)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.chatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .chatId)
		self.menuButton = try container.decodeIfPresent(MenuButton.self, forKey: .menuButton)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
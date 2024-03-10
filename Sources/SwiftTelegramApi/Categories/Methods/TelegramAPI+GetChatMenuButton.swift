import Foundation

extension TelegramAPI {
    /// Use this method to get the current value of the bot's menu button in a private chat, or the default menu button. Returns MenuButton on success.
    public func getChatMenuButton(_ input: GetChatMenuButtonInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<MenuButton>) -> Void) {
        self.requester.request("getChatMenuButton", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getChatMenuButton(_ input: GetChatMenuButtonInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> MenuButton {
        try await self.requester.request("getChatMenuButton", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getChatMenuButton
import Foundation
public final class GetChatMenuButtonInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. Unique identifier for the target private chat. If not specified, default bot's menu button will be returned
	public let chatId: TelegramInteger?

	public init(
		chatId: TelegramInteger? = nil
	) {
		self.chatId = chatId
	}

	private enum CodingKeys: String, CodingKey {
		case chatId = "chat_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.chatId.self, forKey: .chatId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.chatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .chatId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
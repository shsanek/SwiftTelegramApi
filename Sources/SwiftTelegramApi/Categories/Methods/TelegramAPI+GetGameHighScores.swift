import Foundation

extension TelegramAPI {
    /// Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.
    public func getGameHighScores(_ input: GetGameHighScoresInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<[GameHighScore]>) -> Void) {
        self.requester.request("getGameHighScores", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getGameHighScores(_ input: GetGameHighScoresInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> [GameHighScore] {
        try await self.requester.request("getGameHighScores", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getGameHighScores
import Foundation
public final class GetGameHighScoresInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Target user id
	public let userId: TelegramInteger
	
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat
	public let chatId: TelegramInteger?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the sent message
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	public init(
		userId: TelegramInteger,
		chatId: TelegramInteger? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil
	) {
		self.userId = userId
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
	}

	private enum CodingKeys: String, CodingKey {
		case userId = "user_id"
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encodeIfPresent(self.chatId.self, forKey: .chatId)
		try container.encodeIfPresent(self.messageId.self, forKey: .messageId)
		try container.encodeIfPresent(self.inlineMessageId.self, forKey: .inlineMessageId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
		self.chatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .chatId)
		self.messageId = try container.decodeIfPresent(TelegramInteger.self, forKey: .messageId)
		self.inlineMessageId = try container.decodeIfPresent(String.self, forKey: .inlineMessageId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
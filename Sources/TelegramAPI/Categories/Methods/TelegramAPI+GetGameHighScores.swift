extension TelegramAPI {
    /// Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.
    public func getGameHighScores(_ input: GetGameHighScoresInput, completionHandler: @escaping (TelegramResult<[GameHighScore]>) -> Void) {
        self.requester.request("getGameHighScores", object: input, completion: completionHandler)
    }
}

//Input model for request getGameHighScores
public final class GetGameHighScoresInput: Encodable {
	///Yes
	public let userId: TelegramInteger
	
	///Optional
	public let chatId: TelegramInteger?
	
	///Optional
	public let messageId: TelegramInteger?
	
	///Optional
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
}
extension TelegramAPI {
    /// Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.
    public func setGameScore(_ input: SetGameScoreInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("setGameScore", object: input, completion: completionHandler)
    }
}

//Input model for request setGameScore
public final class SetGameScoreInput: Encodable {
	///Yes
	public let userId: TelegramInteger
	
	///Yes
	public let score: TelegramInteger
	
	///Optional
	public let force: Bool?
	
	///Optional
	public let disableEditMessage: Bool?
	
	///Optional
	public let chatId: TelegramInteger?
	
	///Optional
	public let messageId: TelegramInteger?
	
	///Optional
	public let inlineMessageId: String?

	public init(
		userId: TelegramInteger,
		score: TelegramInteger,
		force: Bool? = nil,
		disableEditMessage: Bool? = nil,
		chatId: TelegramInteger? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil
	) {
		self.userId = userId
		self.score = score
		self.force = force
		self.disableEditMessage = disableEditMessage
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
	}

	private enum CodingKeys: String, CodingKey {
		case userId = "user_id"
		case score
		case force
		case disableEditMessage = "disable_edit_message"
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encode(self.score.self, forKey: .score)
		try container.encodeIfPresent(self.force.self, forKey: .force)
		try container.encodeIfPresent(self.disableEditMessage.self, forKey: .disableEditMessage)
		try container.encodeIfPresent(self.chatId.self, forKey: .chatId)
		try container.encodeIfPresent(self.messageId.self, forKey: .messageId)
		try container.encodeIfPresent(self.inlineMessageId.self, forKey: .inlineMessageId)
	}
}
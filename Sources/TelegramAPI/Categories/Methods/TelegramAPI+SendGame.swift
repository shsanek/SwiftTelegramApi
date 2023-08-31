extension TelegramAPI {
    /// Use this method to send a game. On success, the sent Message is returned.
    public func sendGame(_ input: SendGameInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendGame", object: input, completion: completionHandler)
    }
}

//Input model for request sendGame
public final class SendGameInput: Encodable {
	///Yes
	public let chatId: TelegramInteger
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let gameShortName: String
	
	///Optional
	public let disableNotification: Bool
	
	///Optional
	public let protectContent: Bool
	
	///Optional
	public let replyToMessageId: TelegramInteger
	
	///Optional
	public let allowSendingWithoutReply: Bool
	
	///Optional
	public let replyMarkup: InlineKeyboardMarkup

	public init(
		chatId: TelegramInteger,
		messageThreadId: TelegramInteger,
		gameShortName: String,
		disableNotification: Bool,
		protectContent: Bool,
		replyToMessageId: TelegramInteger,
		allowSendingWithoutReply: Bool,
		replyMarkup: InlineKeyboardMarkup
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.gameShortName = gameShortName
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	private enum CodingKeys: String, CodingKey {
		case chatId = "chat_id"
		case messageThreadId = "message_thread_id"
		case gameShortName = "game_short_name"
		case disableNotification = "disable_notification"
		case protectContent = "protect_content"
		case replyToMessageId = "reply_to_message_id"
		case allowSendingWithoutReply = "allow_sending_without_reply"
		case replyMarkup = "reply_markup"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.chatId.self, forKey: .chatId)
		try container.encode(self.messageThreadId.self, forKey: .messageThreadId)
		try container.encode(self.gameShortName.self, forKey: .gameShortName)
		try container.encode(self.disableNotification.self, forKey: .disableNotification)
		try container.encode(self.protectContent.self, forKey: .protectContent)
		try container.encode(self.replyToMessageId.self, forKey: .replyToMessageId)
		try container.encode(self.allowSendingWithoutReply.self, forKey: .allowSendingWithoutReply)
		try container.encode(self.replyMarkup.self, forKey: .replyMarkup)
	}
}
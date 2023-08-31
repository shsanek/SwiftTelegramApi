extension TelegramAPI {
    /// Use this method to send an animated emoji that will display a random value. On success, the sent Message is returned.
    public func sendDice(_ input: SendDiceInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendDice", object: input, completion: completionHandler)
    }
}

//Input model for request sendDice
public final class SendDiceInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Optional
	public let emoji: String?
	
	///Optional
	public let disableNotification: Bool?
	
	///Optional
	public let protectContent: Bool?
	
	///Optional
	public let replyToMessageId: TelegramInteger?
	
	///Optional
	public let allowSendingWithoutReply: Bool?
	
	///Optional
	public let replyMarkup: TelegramMarkupContainer?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		emoji: String? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.emoji = emoji
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("emoji", object: self.emoji)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
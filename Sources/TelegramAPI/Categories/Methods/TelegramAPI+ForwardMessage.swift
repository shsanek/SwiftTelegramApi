extension TelegramAPI {
    /// Use this method to forward messages of any kind. Service messages can't be forwarded. On success, the sent Message is returned.
    public func forwardMessage(_ input: ForwardMessageInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("forwardMessage", object: input, completion: completionHandler)
    }
}

//Input model for request forwardMessage
public final class ForwardMessageInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let fromChatId: TelegramIdentifierContainer
	
	///Optional
	public let disableNotification: Bool
	
	///Optional
	public let protectContent: Bool
	
	///Yes
	public let messageId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		fromChatId: TelegramIdentifierContainer,
		disableNotification: Bool,
		protectContent: Bool,
		messageId: TelegramInteger
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.fromChatId = fromChatId
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.messageId = messageId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("from_chat_id", object: self.fromChatId)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("message_id", object: self.messageId)
	}
}
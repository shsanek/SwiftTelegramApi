extension TelegramAPI {
    /// Use this method to forward messages of any kind. Service messages can't be forwarded. On success, the sent Message is returned.
    public func forwardMessage(_ input: ForwardMessageInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("forwardMessage", object: input, completion: completionHandler)
    }
}

//Input model for request forwardMessage
public final class ForwardMessageInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
	public let fromChatId: TelegramIdentifierContainer
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the forwarded message from forwarding and saving
	public let protectContent: Bool?
	
	///Yes. Message identifier in the chat specified in from_chat_id
	public let messageId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		fromChatId: TelegramIdentifierContainer,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
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
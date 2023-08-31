extension TelegramAPI {
    /// Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
    public func sendChatAction(_ input: SendChatActionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("sendChatAction", object: input, completion: completionHandler)
    }
}

//Input model for request sendChatAction
public final class SendChatActionInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let action: String

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		action: String
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.action = action
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("action", object: self.action)
	}
}
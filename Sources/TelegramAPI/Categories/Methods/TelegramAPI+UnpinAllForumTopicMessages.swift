extension TelegramAPI {
    /// Use this method to clear the list of pinned messages in a forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.
    public func unpinAllForumTopicMessages(_ input: UnpinAllForumTopicMessagesInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unpinAllForumTopicMessages", object: input, completion: completionHandler)
    }
}

//Input model for request unpinAllForumTopicMessages
public final class UnpinAllForumTopicMessagesInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let messageThreadId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
	}
}
extension TelegramAPI {
    /// Use this method to close an open topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.
    public func closeForumTopic(_ input: CloseForumTopicInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("closeForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request closeForumTopic
public final class CloseForumTopicInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier for the target message thread of the forum topic
	public let messageThreadId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
	}
}
extension TelegramAPI {
    /// Use this method to remove a message from the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.
    public func unpinChatMessage(_ input: UnpinChatMessageInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unpinChatMessage", object: input, completion: completionHandler)
    }
}

//Input model for request unpinChatMessage
public final class UnpinChatMessageInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageId: TelegramInteger?

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
	}
}
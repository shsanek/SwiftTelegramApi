extension TelegramAPI {
    /// Use this method to remove a message from the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.
    public func unpinChatMessage(_ input: UnpinChatMessageInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unpinChatMessage", object: input, completion: completionHandler)
    }
}

//Input model for request unpinChatMessage
public final class UnpinChatMessageInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Identifier of a message to unpin. If not specified, the most recent pinned message (by sending date) will be unpinned.
	public let messageId: TelegramInteger?

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_id", object: self.messageId)
	}
}
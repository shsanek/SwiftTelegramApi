extension TelegramAPI {
    /// Use this method to clear the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.
    public func unpinAllChatMessages(_ input: UnpinAllChatMessagesInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unpinAllChatMessages", object: input, completion: completionHandler)
    }
}

//Input model for request unpinAllChatMessages
public final class UnpinAllChatMessagesInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(
		chatId: TelegramIdentifierContainer
	) {
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
	}
}
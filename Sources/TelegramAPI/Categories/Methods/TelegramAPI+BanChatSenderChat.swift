extension TelegramAPI {
    /// Use this method to ban a channel chat in a supergroup or a channel. Until the chat is unbanned, the owner of the banned chat won't be able to send messages on behalf of any of their channels. The bot must be an administrator in the supergroup or channel for this to work and must have the appropriate administrator rights. Returns True on success.
    public func banChatSenderChat(_ input: BanChatSenderChatInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("banChatSenderChat", object: input, completion: completionHandler)
    }
}

//Input model for request banChatSenderChat
public final class BanChatSenderChatInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let senderChatId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		senderChatId: TelegramInteger
	) {
		self.chatId = chatId
		self.senderChatId = senderChatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("sender_chat_id", object: self.senderChatId)
	}
}
extension TelegramAPI {
    /// Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success.
    public func unbanChatSenderChat(_ input: UnbanChatSenderChatInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unbanChatSenderChat", object: input, completion: completionHandler)
    }
}

//Input model for request unbanChatSenderChat
public final class UnbanChatSenderChatInput: IMultiPartFromDataEncodable {
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
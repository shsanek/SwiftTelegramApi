extension TelegramAPI {
    /// Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
    public func leaveChat(_ input: LeaveChatInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("leaveChat", object: input, completion: completionHandler)
    }
}

//Input model for request leaveChat
public final class LeaveChatInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer

	public init(
		chatId: TelegramIdentifierContainer
	) {
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
	}
}
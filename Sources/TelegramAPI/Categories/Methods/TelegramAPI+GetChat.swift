extension TelegramAPI {
    /// Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.
    public func getChat(_ input: GetChatInput, completionHandler: @escaping (TelegramResult<Chat>) -> Void) {
        self.requester.request("getChat", object: input, completion: completionHandler)
    }
}

//Input model for request getChat
public final class GetChatInput: IMultiPartFromDataEncodable {
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
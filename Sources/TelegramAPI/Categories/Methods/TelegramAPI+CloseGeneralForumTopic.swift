extension TelegramAPI {
    /// Use this method to close an open 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns True on success.
    public func closeGeneralForumTopic(_ input: CloseGeneralForumTopicInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("closeGeneralForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request closeGeneralForumTopic
public final class CloseGeneralForumTopicInput: IMultiPartFromDataEncodable {
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
extension TelegramAPI {
    /// Use this method to reopen a closed 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically unhidden if it was hidden. Returns True on success.
    public func reopenGeneralForumTopic(_ input: ReopenGeneralForumTopicInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("reopenGeneralForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request reopenGeneralForumTopic
public final class ReopenGeneralForumTopicInput: IMultiPartFromDataEncodable {
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
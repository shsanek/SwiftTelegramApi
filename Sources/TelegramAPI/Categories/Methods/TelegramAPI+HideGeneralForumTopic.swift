extension TelegramAPI {
    /// Use this method to hide the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. The topic will be automatically closed if it was open. Returns True on success.
    public func hideGeneralForumTopic(_ input: HideGeneralForumTopicInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("hideGeneralForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request hideGeneralForumTopic
public final class HideGeneralForumTopicInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
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
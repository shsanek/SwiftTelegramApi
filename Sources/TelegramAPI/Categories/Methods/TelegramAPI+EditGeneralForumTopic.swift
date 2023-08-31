extension TelegramAPI {
    /// Use this method to edit the name of the 'General' topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights. Returns True on success.
    public func editGeneralForumTopic(_ input: EditGeneralForumTopicInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editGeneralForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request editGeneralForumTopic
public final class EditGeneralForumTopicInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. New topic name, 1-128 characters
	public let name: String

	public init(
		chatId: TelegramIdentifierContainer,
		name: String
	) {
		self.chatId = chatId
		self.name = name
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("name", object: self.name)
	}
}
extension TelegramAPI {
    /// Use this method to clear the list of pinned messages in a General forum topic. The bot must be an administrator in the chat for this to work and must have the can_pin_messages administrator right in the supergroup. Returns True on success.
    public func unpinAllGeneralForumTopicMessages(_ input: UnpinAllGeneralForumTopicMessagesInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unpinAllGeneralForumTopicMessages", object: input, completion: completionHandler)
    }
}

//Input model for request unpinAllGeneralForumTopicMessages
public final class UnpinAllGeneralForumTopicMessagesInput: IMultiPartFromDataEncodable {
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
extension TelegramAPI {
    /// Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func setChatDescription(_ input: SetChatDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatDescription", object: input, completion: completionHandler)
    }
}

//Input model for request setChatDescription
public final class SetChatDescriptionInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let description: String

	public init(
		chatId: TelegramIdentifierContainer,
		description: String
	) {
		self.chatId = chatId
		self.description = description
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("description", object: self.description)
	}
}
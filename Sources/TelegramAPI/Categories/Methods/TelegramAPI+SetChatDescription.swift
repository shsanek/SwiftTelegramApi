extension TelegramAPI {
    /// Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func setChatDescription(_ input: SetChatDescriptionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatDescription", object: input, completion: completionHandler)
    }
}

//Input model for request setChatDescription
public final class SetChatDescriptionInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. New chat description, 0-255 characters
	public let description: String?

	public init(
		chatId: TelegramIdentifierContainer,
		description: String? = nil
	) {
		self.chatId = chatId
		self.description = description
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("description", object: self.description)
	}
}
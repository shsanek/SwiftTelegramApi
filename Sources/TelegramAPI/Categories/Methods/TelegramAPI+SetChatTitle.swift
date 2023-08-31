extension TelegramAPI {
    /// Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func setChatTitle(_ input: SetChatTitleInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatTitle", object: input, completion: completionHandler)
    }
}

//Input model for request setChatTitle
public final class SetChatTitleInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let title: String

	public init(
		chatId: TelegramIdentifierContainer,
		title: String
	) {
		self.chatId = chatId
		self.title = title
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("title", object: self.title)
	}
}
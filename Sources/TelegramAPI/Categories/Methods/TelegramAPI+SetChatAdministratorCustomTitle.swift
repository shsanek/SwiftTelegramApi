extension TelegramAPI {
    /// Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success.
    public func setChatAdministratorCustomTitle(_ input: SetChatAdministratorCustomTitleInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatAdministratorCustomTitle", object: input, completion: completionHandler)
    }
}

//Input model for request setChatAdministratorCustomTitle
public final class SetChatAdministratorCustomTitleInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let userId: TelegramInteger
	
	///Yes
	public let customTitle: String

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		customTitle: String
	) {
		self.chatId = chatId
		self.userId = userId
		self.customTitle = customTitle
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("user_id", object: self.userId)
		encoder.append("custom_title", object: self.customTitle)
	}
}
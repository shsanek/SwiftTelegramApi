extension TelegramAPI {
    /// Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func deleteChatPhoto(_ input: DeleteChatPhotoInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteChatPhoto", object: input, completion: completionHandler)
    }
}

//Input model for request deleteChatPhoto
public final class DeleteChatPhotoInput: IMultiPartFromDataEncodable {
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
extension TelegramAPI {
    /// Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func setChatPhoto(_ input: SetChatPhotoInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatPhoto", object: input, completion: completionHandler)
    }
}

//Input model for request setChatPhoto
public final class SetChatPhotoInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let photo: TelegramInputFile

	public init(
		chatId: TelegramIdentifierContainer,
		photo: TelegramInputFile
	) {
		self.chatId = chatId
		self.photo = photo
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("photo", object: self.photo)
	}
}
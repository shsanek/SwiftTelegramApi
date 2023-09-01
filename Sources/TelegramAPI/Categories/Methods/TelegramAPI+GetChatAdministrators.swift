extension TelegramAPI {
    /// Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.
    public func getChatAdministrators(_ input: GetChatAdministratorsInput, completionHandler: @escaping (TelegramResult<[ChatMember]>) -> Void) {
        self.requester.request("getChatAdministrators", object: input, completion: completionHandler)
    }
}

//Input model for request getChatAdministrators
public final class GetChatAdministratorsInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
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
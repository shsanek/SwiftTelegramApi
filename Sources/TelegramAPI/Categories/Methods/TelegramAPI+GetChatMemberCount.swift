extension TelegramAPI {
    /// Use this method to get the number of members in a chat. Returns Int on success.
    public func getChatMemberCount(_ input: GetChatMemberCountInput, completionHandler: @escaping (TelegramResult<TelegramInteger>) -> Void) {
        self.requester.request("getChatMemberCount", object: input, completion: completionHandler)
    }
}

//Input model for request getChatMemberCount
public final class GetChatMemberCountInput: IMultiPartFromDataEncodable {
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
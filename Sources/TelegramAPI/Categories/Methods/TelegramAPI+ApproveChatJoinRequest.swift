extension TelegramAPI {
    /// Use this method to approve a chat join request. The bot must be an administrator in the chat for this to work and must have the can_invite_users administrator right. Returns True on success.
    public func approveChatJoinRequest(_ input: ApproveChatJoinRequestInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("approveChatJoinRequest", object: input, completion: completionHandler)
    }
}

//Input model for request approveChatJoinRequest
public final class ApproveChatJoinRequestInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger
	) {
		self.chatId = chatId
		self.userId = userId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("user_id", object: self.userId)
	}
}
extension TelegramAPI {
    /// Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func banChatMember(_ input: BanChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("banChatMember", object: input, completion: completionHandler)
    }
}

//Input model for request banChatMember
public final class BanChatMemberInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let userId: TelegramInteger
	
	///Optional
	public let untilDate: TelegramInteger?
	
	///Optional
	public let revokeMessages: Bool?

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		untilDate: TelegramInteger? = nil,
		revokeMessages: Bool? = nil
	) {
		self.chatId = chatId
		self.userId = userId
		self.untilDate = untilDate
		self.revokeMessages = revokeMessages
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("user_id", object: self.userId)
		encoder.append("until_date", object: self.untilDate)
		encoder.append("revoke_messages", object: self.revokeMessages)
	}
}
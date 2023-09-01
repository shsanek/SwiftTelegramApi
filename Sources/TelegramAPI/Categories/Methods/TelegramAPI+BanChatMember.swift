extension TelegramAPI {
    /// Use this method to ban a user in a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    public func banChatMember(_ input: BanChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("banChatMember", object: input, completion: completionHandler)
    }
}

//Input model for request banChatMember
public final class BanChatMemberInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger
	
	///Optional. Date when the user will be unbanned; Unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever. Applied for supergroups and channels only.
	public let untilDate: TelegramInteger?
	
	///Optional. Pass True to delete all messages from the chat for the user that is being removed. If False, the user will be able to see messages in the group that were sent before the user was removed. Always True for supergroups and channels.
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("user_id", object: self.userId)
		try encoder.append("until_date", object: self.untilDate)
		try encoder.append("revoke_messages", object: self.revokeMessages)
	}
}
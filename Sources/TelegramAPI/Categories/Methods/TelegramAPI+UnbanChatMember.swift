extension TelegramAPI {
    /// Use this method to unban a previously banned user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it. So if the user is a member of the chat they will also be removed from the chat. If you don't want this, use the parameter only_if_banned. Returns True on success.
    public func unbanChatMember(_ input: UnbanChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unbanChatMember", object: input, completion: completionHandler)
    }
}

//Input model for request unbanChatMember
public final class UnbanChatMemberInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger
	
	///Optional. Do nothing if the user is not banned
	public let onlyIfBanned: Bool?

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		onlyIfBanned: Bool? = nil
	) {
		self.chatId = chatId
		self.userId = userId
		self.onlyIfBanned = onlyIfBanned
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("user_id", object: self.userId)
		try encoder.append("only_if_banned", object: self.onlyIfBanned)
	}
}
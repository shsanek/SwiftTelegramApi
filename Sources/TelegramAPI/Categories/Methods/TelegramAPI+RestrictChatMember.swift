extension TelegramAPI {
    /// Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.
    public func restrictChatMember(_ input: RestrictChatMemberInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("restrictChatMember", object: input, completion: completionHandler)
    }
}

//Input model for request restrictChatMember
public final class RestrictChatMemberInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let userId: TelegramInteger
	
	///Yes
	public let permissions: ChatPermissions
	
	///Optional
	public let useIndependentChatPermissions: Bool
	
	///Optional
	public let untilDate: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		permissions: ChatPermissions,
		useIndependentChatPermissions: Bool,
		untilDate: TelegramInteger
	) {
		self.chatId = chatId
		self.userId = userId
		self.permissions = permissions
		self.useIndependentChatPermissions = useIndependentChatPermissions
		self.untilDate = untilDate
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("user_id", object: self.userId)
		encoder.append("permissions", object: self.permissions)
		encoder.append("use_independent_chat_permissions", object: self.useIndependentChatPermissions)
		encoder.append("until_date", object: self.untilDate)
	}
}
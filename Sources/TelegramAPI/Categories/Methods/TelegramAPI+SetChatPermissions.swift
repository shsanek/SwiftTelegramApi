extension TelegramAPI {
    /// Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success.
    public func setChatPermissions(_ input: SetChatPermissionsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatPermissions", object: input, completion: completionHandler)
    }
}

//Input model for request setChatPermissions
public final class SetChatPermissionsInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let permissions: ChatPermissions
	
	///Optional
	public let useIndependentChatPermissions: Bool?

	public init(
		chatId: TelegramIdentifierContainer,
		permissions: ChatPermissions,
		useIndependentChatPermissions: Bool? = nil
	) {
		self.chatId = chatId
		self.permissions = permissions
		self.useIndependentChatPermissions = useIndependentChatPermissions
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("permissions", object: self.permissions)
		encoder.append("use_independent_chat_permissions", object: self.useIndependentChatPermissions)
	}
}
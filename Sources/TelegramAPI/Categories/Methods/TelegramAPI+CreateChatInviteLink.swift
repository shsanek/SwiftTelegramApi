extension TelegramAPI {
    /// Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object.
    public func createChatInviteLink(_ input: CreateChatInviteLinkInput, completionHandler: @escaping (TelegramResult<ChatInviteLink>) -> Void) {
        self.requester.request("createChatInviteLink", object: input, completion: completionHandler)
    }
}

//Input model for request createChatInviteLink
public final class CreateChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Invite link name; 0-32 characters
	public let name: String?
	
	///Optional. Point in time (Unix timestamp) when the link will expire
	public let expireDate: TelegramInteger?
	
	///Optional. The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
	public let memberLimit: TelegramInteger?
	
	///Optional. True, if users joining the chat via the link need to be approved by chat administrators. If True, member_limit can't be specified
	public let createsJoinRequest: Bool?

	public init(
		chatId: TelegramIdentifierContainer,
		name: String? = nil,
		expireDate: TelegramInteger? = nil,
		memberLimit: TelegramInteger? = nil,
		createsJoinRequest: Bool? = nil
	) {
		self.chatId = chatId
		self.name = name
		self.expireDate = expireDate
		self.memberLimit = memberLimit
		self.createsJoinRequest = createsJoinRequest
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("name", object: self.name)
		try encoder.append("expire_date", object: self.expireDate)
		try encoder.append("member_limit", object: self.memberLimit)
		try encoder.append("creates_join_request", object: self.createsJoinRequest)
	}
}
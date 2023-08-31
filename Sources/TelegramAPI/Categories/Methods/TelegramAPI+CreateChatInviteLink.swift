extension TelegramAPI {
    /// Use this method to create an additional invite link for a chat. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. The link can be revoked using the method revokeChatInviteLink. Returns the new invite link as ChatInviteLink object.
    public func createChatInviteLink(_ input: CreateChatInviteLinkInput, completionHandler: @escaping (TelegramResult<ChatInviteLink>) -> Void) {
        self.requester.request("createChatInviteLink", object: input, completion: completionHandler)
    }
}

//Input model for request createChatInviteLink
public final class CreateChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let name: String?
	
	///Optional
	public let expireDate: TelegramInteger?
	
	///Optional
	public let memberLimit: TelegramInteger?
	
	///Optional
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

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("name", object: self.name)
		encoder.append("expire_date", object: self.expireDate)
		encoder.append("member_limit", object: self.memberLimit)
		encoder.append("creates_join_request", object: self.createsJoinRequest)
	}
}
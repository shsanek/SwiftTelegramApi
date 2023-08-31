extension TelegramAPI {
    /// Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.
    public func editChatInviteLink(_ input: EditChatInviteLinkInput, completionHandler: @escaping (TelegramResult<ChatInviteLink>) -> Void) {
        self.requester.request("editChatInviteLink", object: input, completion: completionHandler)
    }
}

//Input model for request editChatInviteLink
public final class EditChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let inviteLink: String
	
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
		inviteLink: String,
		name: String? = nil,
		expireDate: TelegramInteger? = nil,
		memberLimit: TelegramInteger? = nil,
		createsJoinRequest: Bool? = nil
	) {
		self.chatId = chatId
		self.inviteLink = inviteLink
		self.name = name
		self.expireDate = expireDate
		self.memberLimit = memberLimit
		self.createsJoinRequest = createsJoinRequest
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("invite_link", object: self.inviteLink)
		encoder.append("name", object: self.name)
		encoder.append("expire_date", object: self.expireDate)
		encoder.append("member_limit", object: self.memberLimit)
		encoder.append("creates_join_request", object: self.createsJoinRequest)
	}
}
extension TelegramAPI {
    /// Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object.
    public func revokeChatInviteLink(_ input: RevokeChatInviteLinkInput, completionHandler: @escaping (TelegramResult<ChatInviteLink>) -> Void) {
        self.requester.request("revokeChatInviteLink", object: input, completion: completionHandler)
    }
}

//Input model for request revokeChatInviteLink
public final class RevokeChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let inviteLink: String

	public init(
		chatId: TelegramIdentifierContainer,
		inviteLink: String
	) {
		self.chatId = chatId
		self.inviteLink = inviteLink
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("invite_link", object: self.inviteLink)
	}
}
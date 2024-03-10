import Foundation

extension TelegramAPI {
    /// Use this method to revoke an invite link created by the bot. If the primary link is revoked, a new link is automatically generated. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the revoked invite link as ChatInviteLink object.
    public func revokeChatInviteLink(_ input: RevokeChatInviteLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<ChatInviteLink>) -> Void) {
        self.requester.request("revokeChatInviteLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func revokeChatInviteLink(_ input: RevokeChatInviteLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> ChatInviteLink {
        try await self.requester.request("revokeChatInviteLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request revokeChatInviteLink
public final class RevokeChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier of the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. The invite link to revoke
	public let inviteLink: String

	public init(
		chatId: TelegramIdentifierContainer,
		inviteLink: String
	) {
		self.chatId = chatId
		self.inviteLink = inviteLink
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("invite_link", object: self.inviteLink)
	}
}
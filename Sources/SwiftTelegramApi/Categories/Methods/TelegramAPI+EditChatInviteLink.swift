import Foundation

extension TelegramAPI {
    /// Use this method to edit a non-primary invite link created by the bot. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the edited invite link as a ChatInviteLink object.
    public func editChatInviteLink(_ input: EditChatInviteLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<ChatInviteLink>) -> Void) {
        self.requester.request("editChatInviteLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func editChatInviteLink(_ input: EditChatInviteLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> ChatInviteLink {
        try await self.requester.request("editChatInviteLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request editChatInviteLink
public final class EditChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. The invite link to edit
	public let inviteLink: String
	
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("invite_link", object: self.inviteLink)
		try encoder.append("name", object: self.name)
		try encoder.append("expire_date", object: self.expireDate)
		try encoder.append("member_limit", object: self.memberLimit)
		try encoder.append("creates_join_request", object: self.createsJoinRequest)
	}
}
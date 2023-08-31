extension TelegramAPI {
    /// Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.
    public func exportChatInviteLink(_ input: ExportChatInviteLinkInput, completionHandler: @escaping (TelegramResult<String>) -> Void) {
        self.requester.request("exportChatInviteLink", object: input, completion: completionHandler)
    }
}

//Input model for request exportChatInviteLink
public final class ExportChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer

	public init(
		chatId: TelegramIdentifierContainer
	) {
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
	}
}
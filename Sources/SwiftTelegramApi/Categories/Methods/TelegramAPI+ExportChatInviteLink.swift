import Foundation

extension TelegramAPI {
    /// Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.
    public func exportChatInviteLink(_ input: ExportChatInviteLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<String>) -> Void) {
        self.requester.request("exportChatInviteLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func exportChatInviteLink(_ input: ExportChatInviteLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> String {
        try await self.requester.request("exportChatInviteLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request exportChatInviteLink
public final class ExportChatInviteLinkInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(
		chatId: TelegramIdentifierContainer
	) {
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
	}
}
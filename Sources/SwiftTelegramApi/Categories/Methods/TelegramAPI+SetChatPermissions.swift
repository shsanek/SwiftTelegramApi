import Foundation

extension TelegramAPI {
    /// Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members administrator rights. Returns True on success.
    public func setChatPermissions(_ input: SetChatPermissionsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatPermissions", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func setChatPermissions(_ input: SetChatPermissionsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("setChatPermissions", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request setChatPermissions
public final class SetChatPermissionsInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. A JSON-serialized object for new default chat permissions
	public let permissions: ChatPermissions
	
	///Optional. Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("permissions", object: self.permissions)
		try encoder.append("use_independent_chat_permissions", object: self.useIndependentChatPermissions)
	}
}
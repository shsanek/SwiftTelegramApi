import Foundation

extension TelegramAPI {
    /// Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate administrator rights. Pass True for all permissions to lift restrictions from a user. Returns True on success.
    public func restrictChatMember(_ input: RestrictChatMemberInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("restrictChatMember", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request restrictChatMember
public final class RestrictChatMemberInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger
	
	///Yes. A JSON-serialized object for new user permissions
	public let permissions: ChatPermissions
	
	///Optional. Pass True if chat permissions are set independently. Otherwise, the can_send_other_messages and can_add_web_page_previews permissions will imply the can_send_messages, can_send_audios, can_send_documents, can_send_photos, can_send_videos, can_send_video_notes, and can_send_voice_notes permissions; the can_send_polls permission will imply the can_send_messages permission.
	public let useIndependentChatPermissions: Bool?
	
	///Optional. Date when restrictions will be lifted for the user; Unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever
	public let untilDate: TelegramInteger?

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		permissions: ChatPermissions,
		useIndependentChatPermissions: Bool? = nil,
		untilDate: TelegramInteger? = nil
	) {
		self.chatId = chatId
		self.userId = userId
		self.permissions = permissions
		self.useIndependentChatPermissions = useIndependentChatPermissions
		self.untilDate = untilDate
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("user_id", object: self.userId)
		try encoder.append("permissions", object: self.permissions)
		try encoder.append("use_independent_chat_permissions", object: self.useIndependentChatPermissions)
		try encoder.append("until_date", object: self.untilDate)
	}
}
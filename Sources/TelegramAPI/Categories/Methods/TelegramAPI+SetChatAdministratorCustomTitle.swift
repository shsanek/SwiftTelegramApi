import Foundation

extension TelegramAPI {
    /// Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success.
    public func setChatAdministratorCustomTitle(_ input: SetChatAdministratorCustomTitleInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatAdministratorCustomTitle", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request setChatAdministratorCustomTitle
public final class SetChatAdministratorCustomTitleInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger
	
	///Yes. New custom title for the administrator; 0-16 characters, emoji are not allowed
	public let customTitle: String

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger,
		customTitle: String
	) {
		self.chatId = chatId
		self.userId = userId
		self.customTitle = customTitle
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("user_id", object: self.userId)
		try encoder.append("custom_title", object: self.customTitle)
	}
}
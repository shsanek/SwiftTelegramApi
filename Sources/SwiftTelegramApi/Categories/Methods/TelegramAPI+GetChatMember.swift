import Foundation

extension TelegramAPI {
    /// Use this method to get information about a member of a chat. The method is only guaranteed to work for other users if the bot is an administrator in the chat. Returns a ChatMember object on success.
    public func getChatMember(_ input: GetChatMemberInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<ChatMember>) -> Void) {
        self.requester.request("getChatMember", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getChatMember(_ input: GetChatMemberInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> ChatMember {
        try await self.requester.request("getChatMember", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getChatMember
public final class GetChatMemberInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target user
	public let userId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger
	) {
		self.chatId = chatId
		self.userId = userId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("user_id", object: self.userId)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to reopen a closed topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.
    public func reopenForumTopic(_ input: ReopenForumTopicInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("reopenForumTopic", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func reopenForumTopic(_ input: ReopenForumTopicInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("reopenForumTopic", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request reopenForumTopic
public final class ReopenForumTopicInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier for the target message thread of the forum topic
	public let messageThreadId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
	}
}
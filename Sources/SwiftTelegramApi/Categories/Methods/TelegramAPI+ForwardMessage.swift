import Foundation

extension TelegramAPI {
    /// Use this method to forward messages of any kind. Service messages can't be forwarded. On success, the sent Message is returned.
    public func forwardMessage(_ input: ForwardMessageInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("forwardMessage", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func forwardMessage(_ input: ForwardMessageInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Message {
        try await self.requester.request("forwardMessage", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request forwardMessage
public final class ForwardMessageInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
	public let fromChatId: TelegramIdentifierContainer
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the forwarded message from forwarding and saving
	public let protectContent: Bool?
	
	///Yes. Message identifier in the chat specified in from_chat_id
	public let messageId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		fromChatId: TelegramIdentifierContainer,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		messageId: TelegramInteger
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.fromChatId = fromChatId
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.messageId = messageId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("from_chat_id", object: self.fromChatId)
		try encoder.append("disable_notification", object: self.disableNotification)
		try encoder.append("protect_content", object: self.protectContent)
		try encoder.append("message_id", object: self.messageId)
	}
}
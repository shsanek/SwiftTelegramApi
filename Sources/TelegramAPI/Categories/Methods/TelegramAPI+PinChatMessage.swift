import Foundation

extension TelegramAPI {
    /// Use this method to add a message to the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.
    public func pinChatMessage(_ input: PinChatMessageInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("pinChatMessage", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request pinChatMessage
public final class PinChatMessageInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Identifier of a message to pin
	public let messageId: TelegramInteger
	
	///Optional. Pass True if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.
	public let disableNotification: Bool?

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		disableNotification: Bool? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.disableNotification = disableNotification
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_id", object: self.messageId)
		try encoder.append("disable_notification", object: self.disableNotification)
	}
}
extension TelegramAPI {
    /// Use this method to add a message to the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' administrator right in a supergroup or 'can_edit_messages' administrator right in a channel. Returns True on success.
    public func pinChatMessage(_ input: PinChatMessageInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("pinChatMessage", object: input, completion: completionHandler)
    }
}

//Input model for request pinChatMessage
public final class PinChatMessageInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let messageId: TelegramInteger
	
	///Optional
	public let disableNotification: Bool

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		disableNotification: Bool
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.disableNotification = disableNotification
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("disable_notification", object: self.disableNotification)
	}
}
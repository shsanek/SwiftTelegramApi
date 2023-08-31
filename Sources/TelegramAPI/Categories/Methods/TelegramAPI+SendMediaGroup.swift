extension TelegramAPI {
    /// Use this method to send a group of photos, videos, documents or audios as an album. Documents and audio files can be only grouped in an album with messages of the same type. On success, an array of Messages that were sent is returned.
    public func sendMediaGroup(_ input: SendMediaGroupInput, completionHandler: @escaping (TelegramResult<[Message]>) -> Void) {
        self.requester.request("sendMediaGroup", object: input, completion: completionHandler)
    }
}

//Input model for request sendMediaGroup
public final class SendMediaGroupInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let media: [TelegramInputMediaContainer]
	
	///Optional
	public let disableNotification: Bool
	
	///Optional
	public let protectContent: Bool
	
	///Optional
	public let replyToMessageId: TelegramInteger
	
	///Optional
	public let allowSendingWithoutReply: Bool

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		media: [TelegramInputMediaContainer],
		disableNotification: Bool,
		protectContent: Bool,
		replyToMessageId: TelegramInteger,
		allowSendingWithoutReply: Bool
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.media = media
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("media", object: self.media)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
	}
}
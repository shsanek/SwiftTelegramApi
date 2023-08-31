extension TelegramAPI {
    /// As of v.4.0, Telegram clients support rounded square MPEG4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned.
    public func sendVideoNote(_ input: SendVideoNoteInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendVideoNote", object: input, completion: completionHandler)
    }
}

//Input model for request sendVideoNote
public final class SendVideoNoteInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let videoNote: TelegramInputFileContainer
	
	///Optional
	public let duration: TelegramInteger?
	
	///Optional
	public let length: TelegramInteger?
	
	///Optional
	public let thumbnail: TelegramInputFileContainer?
	
	///Optional
	public let disableNotification: Bool?
	
	///Optional
	public let protectContent: Bool?
	
	///Optional
	public let replyToMessageId: TelegramInteger?
	
	///Optional
	public let allowSendingWithoutReply: Bool?
	
	///Optional
	public let replyMarkup: TelegramMarkupContainer?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		videoNote: TelegramInputFileContainer,
		duration: TelegramInteger? = nil,
		length: TelegramInteger? = nil,
		thumbnail: TelegramInputFileContainer? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.videoNote = videoNote
		self.duration = duration
		self.length = length
		self.thumbnail = thumbnail
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("video_note", object: self.videoNote)
		encoder.append("duration", object: self.duration)
		encoder.append("length", object: self.length)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
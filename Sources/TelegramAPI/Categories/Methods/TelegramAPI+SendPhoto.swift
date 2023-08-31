extension TelegramAPI {
    /// Use this method to send photos. On success, the sent Message is returned.
    public func sendPhoto(_ input: SendPhotoInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendPhoto", object: input, completion: completionHandler)
    }
}

//Input model for request sendPhoto
public final class SendPhotoInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let photo: TelegramInputFileContainer
	
	///Optional
	public let caption: String?
	
	///Optional
	public let parseMode: String?
	
	///Optional
	public let captionEntities: [MessageEntity]?
	
	///Optional
	public let hasSpoiler: Bool?
	
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
		photo: TelegramInputFileContainer,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		hasSpoiler: Bool? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.photo = photo
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.hasSpoiler = hasSpoiler
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("photo", object: self.photo)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("has_spoiler", object: self.hasSpoiler)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
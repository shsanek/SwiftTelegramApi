extension TelegramAPI {
    /// Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.
    public func sendDocument(_ input: SendDocumentInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendDocument", object: input, completion: completionHandler)
    }
}

//Input model for request sendDocument
public final class SendDocumentInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let document: TelegramInputFileContainer
	
	///Optional
	public let thumbnail: TelegramInputFileContainer
	
	///Optional
	public let caption: String
	
	///Optional
	public let parseMode: String
	
	///Optional
	public let captionEntities: [MessageEntity]
	
	///Optional
	public let disableContentTypeDetection: Bool
	
	///Optional
	public let disableNotification: Bool
	
	///Optional
	public let protectContent: Bool
	
	///Optional
	public let replyToMessageId: TelegramInteger
	
	///Optional
	public let allowSendingWithoutReply: Bool
	
	///Optional
	public let replyMarkup: TelegramMarkupContainer

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		document: TelegramInputFileContainer,
		thumbnail: TelegramInputFileContainer,
		caption: String,
		parseMode: String,
		captionEntities: [MessageEntity],
		disableContentTypeDetection: Bool,
		disableNotification: Bool,
		protectContent: Bool,
		replyToMessageId: TelegramInteger,
		allowSendingWithoutReply: Bool,
		replyMarkup: TelegramMarkupContainer
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.document = document
		self.thumbnail = thumbnail
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.disableContentTypeDetection = disableContentTypeDetection
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("document", object: self.document)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("disable_content_type_detection", object: self.disableContentTypeDetection)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
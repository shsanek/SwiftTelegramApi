extension TelegramAPI {
    /// Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future.
    public func sendAnimation(_ input: SendAnimationInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendAnimation", object: input, completion: completionHandler)
    }
}

//Input model for request sendAnimation
public final class SendAnimationInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let animation: TelegramInputFileContainer
	
	///Optional
	public let duration: TelegramInteger?
	
	///Optional
	public let width: TelegramInteger?
	
	///Optional
	public let height: TelegramInteger?
	
	///Optional
	public let thumbnail: TelegramInputFileContainer?
	
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
		animation: TelegramInputFileContainer,
		duration: TelegramInteger? = nil,
		width: TelegramInteger? = nil,
		height: TelegramInteger? = nil,
		thumbnail: TelegramInputFileContainer? = nil,
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
		self.animation = animation
		self.duration = duration
		self.width = width
		self.height = height
		self.thumbnail = thumbnail
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
		encoder.append("animation", object: self.animation)
		encoder.append("duration", object: self.duration)
		encoder.append("width", object: self.width)
		encoder.append("height", object: self.height)
		encoder.append("thumbnail", object: self.thumbnail)
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
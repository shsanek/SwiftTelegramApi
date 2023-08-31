extension TelegramAPI {
    /// Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .MP3 or .M4A format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
    public func sendAudio(_ input: SendAudioInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendAudio", object: input, completion: completionHandler)
    }
}

//Input model for request sendAudio
public final class SendAudioInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let audio: TelegramInputFileContainer
	
	///Optional
	public let caption: String
	
	///Optional
	public let parseMode: String
	
	///Optional
	public let captionEntities: [MessageEntity]
	
	///Optional
	public let duration: TelegramInteger
	
	///Optional
	public let performer: String
	
	///Optional
	public let title: String
	
	///Optional
	public let thumbnail: TelegramInputFileContainer
	
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
		audio: TelegramInputFileContainer,
		caption: String,
		parseMode: String,
		captionEntities: [MessageEntity],
		duration: TelegramInteger,
		performer: String,
		title: String,
		thumbnail: TelegramInputFileContainer,
		disableNotification: Bool,
		protectContent: Bool,
		replyToMessageId: TelegramInteger,
		allowSendingWithoutReply: Bool,
		replyMarkup: TelegramMarkupContainer
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.audio = audio
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.duration = duration
		self.performer = performer
		self.title = title
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
		encoder.append("audio", object: self.audio)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("duration", object: self.duration)
		encoder.append("performer", object: self.performer)
		encoder.append("title", object: self.title)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
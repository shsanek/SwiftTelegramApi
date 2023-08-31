extension TelegramAPI {
    /// Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageCaption(_ input: EditMessageCaptionInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("editMessageCaption", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageCaption
public final class EditMessageCaptionInput: IMultiPartFromDataEncodable {
	///Optional
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageId: TelegramInteger
	
	///Optional
	public let inlineMessageId: String
	
	///Optional
	public let caption: String
	
	///Optional
	public let parseMode: String
	
	///Optional
	public let captionEntities: [MessageEntity]
	
	///Optional
	public let replyMarkup: InlineKeyboardMarkup

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		inlineMessageId: String,
		caption: String,
		parseMode: String,
		captionEntities: [MessageEntity],
		replyMarkup: InlineKeyboardMarkup
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("inline_message_id", object: self.inlineMessageId)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
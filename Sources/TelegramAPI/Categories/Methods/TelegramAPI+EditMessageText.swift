extension TelegramAPI {
    /// Use this method to edit text and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageText(_ input: EditMessageTextInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editMessageText", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageText
public final class EditMessageTextInput: IMultiPartFromDataEncodable {
	///Optional
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageId: TelegramInteger
	
	///Optional
	public let inlineMessageId: String
	
	///Yes
	public let text: String
	
	///Optional
	public let parseMode: String
	
	///Optional
	public let entities: [MessageEntity]
	
	///Optional
	public let disableWebPagePreview: Bool
	
	///Optional
	public let replyMarkup: InlineKeyboardMarkup

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		inlineMessageId: String,
		text: String,
		parseMode: String,
		entities: [MessageEntity],
		disableWebPagePreview: Bool,
		replyMarkup: InlineKeyboardMarkup
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.text = text
		self.parseMode = parseMode
		self.entities = entities
		self.disableWebPagePreview = disableWebPagePreview
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("inline_message_id", object: self.inlineMessageId)
		encoder.append("text", object: self.text)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("entities", object: self.entities)
		encoder.append("disable_web_page_preview", object: self.disableWebPagePreview)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
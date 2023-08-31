extension TelegramAPI {
    /// Use this method to edit text and game messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageText(_ input: EditMessageTextInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("editMessageText", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageText
public final class EditMessageTextInput: IMultiPartFromDataEncodable {
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?
	
	///Yes. New text of the message, 1-4096 characters after entities parsing
	public let text: String
	
	///Optional. Mode for parsing entities in the message text. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
	public let entities: [MessageEntity]?
	
	///Optional. Disables link previews for links in this message
	public let disableWebPagePreview: Bool?
	
	///Optional. A JSON-serialized object for an inline keyboard.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil,
		text: String,
		parseMode: String? = nil,
		entities: [MessageEntity]? = nil,
		disableWebPagePreview: Bool? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
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
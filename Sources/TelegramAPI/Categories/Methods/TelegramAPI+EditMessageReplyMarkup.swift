extension TelegramAPI {
    /// Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageReplyMarkup(_ input: EditMessageReplyMarkupInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editMessageReplyMarkup", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageReplyMarkup
public final class EditMessageReplyMarkupInput: IMultiPartFromDataEncodable {
	///Optional
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageId: TelegramInteger
	
	///Optional
	public let inlineMessageId: String
	
	///Optional
	public let replyMarkup: InlineKeyboardMarkup

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		inlineMessageId: String,
		replyMarkup: InlineKeyboardMarkup
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("inline_message_id", object: self.inlineMessageId)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
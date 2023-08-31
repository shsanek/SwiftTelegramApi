extension TelegramAPI {
    /// Use this method to edit animation, audio, document, photo, or video messages. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageMedia(_ input: EditMessageMediaInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("editMessageMedia", object: input, completion: completionHandler)
    }
}

//Input model for request editMessageMedia
public final class EditMessageMediaInput: IMultiPartFromDataEncodable {
	///Optional
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageId: TelegramInteger
	
	///Optional
	public let inlineMessageId: String
	
	///Yes
	public let media: InputMedia
	
	///Optional
	public let replyMarkup: InlineKeyboardMarkup

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		inlineMessageId: String,
		media: InputMedia,
		replyMarkup: InlineKeyboardMarkup
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.media = media
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("inline_message_id", object: self.inlineMessageId)
		encoder.append("media", object: self.media)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
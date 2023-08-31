extension TelegramAPI {
    /// Use this method to send text messages. On success, the sent Message is returned.
    public func sendMessage(_ input: SendMessageInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendMessage", object: input, completion: completionHandler)
    }
}

//Input model for request sendMessage
public final class SendMessageInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger
	
	///Yes
	public let text: String
	
	///Optional
	public let parseMode: String
	
	///Optional
	public let entities: [MessageEntity]
	
	///Optional
	public let disableWebPagePreview: Bool
	
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
		text: String,
		parseMode: String,
		entities: [MessageEntity],
		disableWebPagePreview: Bool,
		disableNotification: Bool,
		protectContent: Bool,
		replyToMessageId: TelegramInteger,
		allowSendingWithoutReply: Bool,
		replyMarkup: TelegramMarkupContainer
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.text = text
		self.parseMode = parseMode
		self.entities = entities
		self.disableWebPagePreview = disableWebPagePreview
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("text", object: self.text)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("entities", object: self.entities)
		encoder.append("disable_web_page_preview", object: self.disableWebPagePreview)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
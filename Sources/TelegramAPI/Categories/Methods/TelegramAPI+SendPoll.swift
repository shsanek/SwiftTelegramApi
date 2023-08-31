extension TelegramAPI {
    /// Use this method to send a native poll. On success, the sent Message is returned.
    public func sendPoll(_ input: SendPollInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendPoll", object: input, completion: completionHandler)
    }
}

//Input model for request sendPoll
public final class SendPollInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let question: String
	
	///Yes
	public let options: [String]
	
	///Optional
	public let isAnonymous: Bool?
	
	///Optional
	public let type: String?
	
	///Optional
	public let allowsMultipleAnswers: Bool?
	
	///Optional
	public let correctOptionId: TelegramInteger?
	
	///Optional
	public let explanation: String?
	
	///Optional
	public let explanationParseMode: String?
	
	///Optional
	public let explanationEntities: [MessageEntity]?
	
	///Optional
	public let openPeriod: TelegramInteger?
	
	///Optional
	public let closeDate: TelegramInteger?
	
	///Optional
	public let isClosed: Bool?
	
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
		question: String,
		options: [String],
		isAnonymous: Bool? = nil,
		type: String? = nil,
		allowsMultipleAnswers: Bool? = nil,
		correctOptionId: TelegramInteger? = nil,
		explanation: String? = nil,
		explanationParseMode: String? = nil,
		explanationEntities: [MessageEntity]? = nil,
		openPeriod: TelegramInteger? = nil,
		closeDate: TelegramInteger? = nil,
		isClosed: Bool? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.question = question
		self.options = options
		self.isAnonymous = isAnonymous
		self.type = type
		self.allowsMultipleAnswers = allowsMultipleAnswers
		self.correctOptionId = correctOptionId
		self.explanation = explanation
		self.explanationParseMode = explanationParseMode
		self.explanationEntities = explanationEntities
		self.openPeriod = openPeriod
		self.closeDate = closeDate
		self.isClosed = isClosed
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("question", object: self.question)
		encoder.append("options", object: self.options)
		encoder.append("is_anonymous", object: self.isAnonymous)
		encoder.append("type", object: self.type)
		encoder.append("allows_multiple_answers", object: self.allowsMultipleAnswers)
		encoder.append("correct_option_id", object: self.correctOptionId)
		encoder.append("explanation", object: self.explanation)
		encoder.append("explanation_parse_mode", object: self.explanationParseMode)
		encoder.append("explanation_entities", object: self.explanationEntities)
		encoder.append("open_period", object: self.openPeriod)
		encoder.append("close_date", object: self.closeDate)
		encoder.append("is_closed", object: self.isClosed)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
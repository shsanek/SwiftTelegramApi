extension TelegramAPI {
    /// Use this method to send a native poll. On success, the sent Message is returned.
    public func sendPoll(_ input: SendPollInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendPoll", object: input, completion: completionHandler)
    }
}

//Input model for request sendPoll
public final class SendPollInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Poll question, 1-300 characters
	public let question: String
	
	///Yes. A JSON-serialized list of answer options, 2-10 strings 1-100 characters each
	public let options: [String]
	
	///Optional. True, if the poll needs to be anonymous, defaults to True
	public let isAnonymous: Bool?
	
	///Optional. Poll type, “quiz” or “regular”, defaults to “regular”
	public let type: String?
	
	///Optional. True, if the poll allows multiple answers, ignored for polls in quiz mode, defaults to False
	public let allowsMultipleAnswers: Bool?
	
	///Optional. 0-based identifier of the correct answer option, required for polls in quiz mode
	public let correctOptionId: TelegramInteger?
	
	///Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters with at most 2 line feeds after entities parsing
	public let explanation: String?
	
	///Optional. Mode for parsing entities in the explanation. See formatting options for more details.
	public let explanationParseMode: String?
	
	///Optional. A JSON-serialized list of special entities that appear in the poll explanation, which can be specified instead of parse_mode
	public let explanationEntities: [MessageEntity]?
	
	///Optional. Amount of time in seconds the poll will be active after creation, 5-600. Can't be used together with close_date.
	public let openPeriod: TelegramInteger?
	
	///Optional. Point in time (Unix timestamp) when the poll will be automatically closed. Must be at least 5 and no more than 600 seconds in the future. Can't be used together with open_period.
	public let closeDate: TelegramInteger?
	
	///Optional. Pass True if the poll needs to be immediately closed. This can be useful for poll preview.
	public let isClosed: Bool?
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the sent message from forwarding and saving
	public let protectContent: Bool?
	
	///Optional. If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?
	
	///Optional. Pass True if the message should be sent even if the specified replied-to message is not found
	public let allowSendingWithoutReply: Bool?
	
	///Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
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
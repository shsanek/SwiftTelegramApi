extension TelegramAPI {
    /// Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func stopMessageLiveLocation(_ input: StopMessageLiveLocationInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("stopMessageLiveLocation", object: input, completion: completionHandler)
    }
}

//Input model for request stopMessageLiveLocation
public final class StopMessageLiveLocationInput: IMultiPartFromDataEncodable {
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
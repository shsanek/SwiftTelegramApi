extension TelegramAPI {
    /// Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func stopMessageLiveLocation(_ input: StopMessageLiveLocationInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("stopMessageLiveLocation", object: input, completion: completionHandler)
    }
}

//Input model for request stopMessageLiveLocation
public final class StopMessageLiveLocationInput: IMultiPartFromDataEncodable {
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the message with live location to stop
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?
	
	///Optional. A JSON-serialized object for a new inline keyboard.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_id", object: self.messageId)
		try encoder.append("inline_message_id", object: self.inlineMessageId)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
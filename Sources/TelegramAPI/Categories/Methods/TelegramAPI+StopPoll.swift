extension TelegramAPI {
    /// Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.
    public func stopPoll(_ input: StopPollInput, completionHandler: @escaping (TelegramResult<Poll>) -> Void) {
        self.requester.request("stopPoll", object: input, completion: completionHandler)
    }
}

//Input model for request stopPoll
public final class StopPollInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Identifier of the original message with the poll
	public let messageId: TelegramInteger
	
	///Optional. A JSON-serialized object for a new message inline keyboard.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer,
		messageId: TelegramInteger,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_id", object: self.messageId)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
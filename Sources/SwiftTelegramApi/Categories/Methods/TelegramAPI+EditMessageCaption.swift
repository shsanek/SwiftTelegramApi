import Foundation

extension TelegramAPI {
    /// Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageCaption(_ input: EditMessageCaptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editMessageCaption", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func editMessageCaption(_ input: EditMessageCaptionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("editMessageCaption", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request editMessageCaption
public final class EditMessageCaptionInput: IMultiPartFromDataEncodable {
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?
	
	///Optional. New caption of the message, 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the message caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. A JSON-serialized object for an inline keyboard.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_id", object: self.messageId)
		try encoder.append("inline_message_id", object: self.inlineMessageId)
		try encoder.append("caption", object: self.caption)
		try encoder.append("parse_mode", object: self.parseMode)
		try encoder.append("caption_entities", object: self.captionEntities)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
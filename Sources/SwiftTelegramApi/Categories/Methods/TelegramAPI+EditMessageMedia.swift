import Foundation

extension TelegramAPI {
    /// Use this method to edit animation, audio, document, photo, or video messages. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    public func editMessageMedia(_ input: EditMessageMediaInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editMessageMedia", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    public func editMessageMedia(_ input: EditMessageMediaInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("editMessageMedia", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request editMessageMedia
public final class EditMessageMediaInput: IMultiPartFromDataEncodable {
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?
	
	///Yes. A JSON-serialized object for a new media content of the message
	public let media: InputMedia
	
	///Optional. A JSON-serialized object for a new inline keyboard.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil,
		media: InputMedia,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.media = media
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_id", object: self.messageId)
		try encoder.append("inline_message_id", object: self.inlineMessageId)
		try encoder.append("media", object: self.media)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
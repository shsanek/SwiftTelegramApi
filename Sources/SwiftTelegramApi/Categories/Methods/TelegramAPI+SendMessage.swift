import Foundation

extension TelegramAPI {
    /// Use this method to send text messages. On success, the sent Message is returned.
    public func sendMessage(_ input: SendMessageInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendMessage", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func sendMessage(_ input: SendMessageInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Message {
        try await self.requester.request("sendMessage", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request sendMessage
public final class SendMessageInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Text of the message to be sent, 1-4096 characters after entities parsing
	public let text: String
	
	///Optional. Mode for parsing entities in the message text. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse_mode
	public let entities: [MessageEntity]?
	
	///Optional. Disables link previews for links in this message
	public let disableWebPagePreview: Bool?
	
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
		text: String,
		parseMode: String? = nil,
		entities: [MessageEntity]? = nil,
		disableWebPagePreview: Bool? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("text", object: self.text)
		try encoder.append("parse_mode", object: self.parseMode)
		try encoder.append("entities", object: self.entities)
		try encoder.append("disable_web_page_preview", object: self.disableWebPagePreview)
		try encoder.append("disable_notification", object: self.disableNotification)
		try encoder.append("protect_content", object: self.protectContent)
		try encoder.append("reply_to_message_id", object: self.replyToMessageId)
		try encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
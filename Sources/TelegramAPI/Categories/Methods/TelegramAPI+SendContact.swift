extension TelegramAPI {
    /// Use this method to send phone contacts. On success, the sent Message is returned.
    public func sendContact(_ input: SendContactInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendContact", object: input, completion: completionHandler)
    }
}

//Input model for request sendContact
public final class SendContactInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let phoneNumber: String
	
	///Yes
	public let firstName: String
	
	///Optional
	public let lastName: String?
	
	///Optional
	public let vcard: String?
	
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
		phoneNumber: String,
		firstName: String,
		lastName: String? = nil,
		vcard: String? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.vcard = vcard
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("phone_number", object: self.phoneNumber)
		encoder.append("first_name", object: self.firstName)
		encoder.append("last_name", object: self.lastName)
		encoder.append("vcard", object: self.vcard)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
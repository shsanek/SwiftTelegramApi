import Foundation

extension TelegramAPI {
    /// Use this method to send phone contacts. On success, the sent Message is returned.
    public func sendContact(_ input: SendContactInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendContact", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request sendContact
public final class SendContactInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Contact's phone number
	public let phoneNumber: String
	
	///Yes. Contact's first name
	public let firstName: String
	
	///Optional. Contact's last name
	public let lastName: String?
	
	///Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
	public let vcard: String?
	
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

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("phone_number", object: self.phoneNumber)
		try encoder.append("first_name", object: self.firstName)
		try encoder.append("last_name", object: self.lastName)
		try encoder.append("vcard", object: self.vcard)
		try encoder.append("disable_notification", object: self.disableNotification)
		try encoder.append("protect_content", object: self.protectContent)
		try encoder.append("reply_to_message_id", object: self.replyToMessageId)
		try encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
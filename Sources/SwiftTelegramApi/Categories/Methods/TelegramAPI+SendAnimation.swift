import Foundation

extension TelegramAPI {
    /// Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future.
    public func sendAnimation(_ input: SendAnimationInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendAnimation", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func sendAnimation(_ input: SendAnimationInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Message {
        try await self.requester.request("sendAnimation", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request sendAnimation
public final class SendAnimationInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Animation to send. Pass a file_id as String to send an animation that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an animation from the Internet, or upload a new animation using multipart/form-data. More information on Sending Files »
	public let animation: TelegramInputFileContainer
	
	///Optional. Duration of sent animation in seconds
	public let duration: TelegramInteger?
	
	///Optional. Animation width
	public let width: TelegramInteger?
	
	///Optional. Animation height
	public let height: TelegramInteger?
	
	///Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More information on Sending Files »
	public let thumbnail: TelegramInputFileContainer?
	
	///Optional. Animation caption (may also be used when resending animation by file_id), 0-1024 characters after entities parsing
	public let caption: String?
	
	///Optional. Mode for parsing entities in the animation caption. See formatting options for more details.
	public let parseMode: String?
	
	///Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
	public let captionEntities: [MessageEntity]?
	
	///Optional. Pass True if the animation needs to be covered with a spoiler animation
	public let hasSpoiler: Bool?
	
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
		animation: TelegramInputFileContainer,
		duration: TelegramInteger? = nil,
		width: TelegramInteger? = nil,
		height: TelegramInteger? = nil,
		thumbnail: TelegramInputFileContainer? = nil,
		caption: String? = nil,
		parseMode: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		hasSpoiler: Bool? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.animation = animation
		self.duration = duration
		self.width = width
		self.height = height
		self.thumbnail = thumbnail
		self.caption = caption
		self.parseMode = parseMode
		self.captionEntities = captionEntities
		self.hasSpoiler = hasSpoiler
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("animation", object: self.animation)
		try encoder.append("duration", object: self.duration)
		try encoder.append("width", object: self.width)
		try encoder.append("height", object: self.height)
		try encoder.append("thumbnail", object: self.thumbnail)
		try encoder.append("caption", object: self.caption)
		try encoder.append("parse_mode", object: self.parseMode)
		try encoder.append("caption_entities", object: self.captionEntities)
		try encoder.append("has_spoiler", object: self.hasSpoiler)
		try encoder.append("disable_notification", object: self.disableNotification)
		try encoder.append("protect_content", object: self.protectContent)
		try encoder.append("reply_to_message_id", object: self.replyToMessageId)
		try encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
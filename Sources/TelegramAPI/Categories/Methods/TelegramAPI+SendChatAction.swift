import Foundation

extension TelegramAPI {
    /// Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
    public func sendChatAction(_ input: SendChatActionInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("sendChatAction", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request sendChatAction
public final class SendChatActionInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread; supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_voice or upload_voice for voice notes, upload_document for general files, choose_sticker for stickers, find_location for location data, record_video_note or upload_video_note for video notes.
	public let action: String

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		action: String
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.action = action
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("action", object: self.action)
	}
}
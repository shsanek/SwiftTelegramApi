import Foundation

extension TelegramAPI {
    /// Use this method to send a game. On success, the sent Message is returned.
    public func sendGame(_ input: SendGameInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendGame", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request sendGame
import Foundation
public final class SendGameInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier for the target chat
	public let chatId: TelegramInteger
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Short name of the game, serves as the unique identifier for the game. Set up your games via @BotFather.
	public let gameShortName: String
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the sent message from forwarding and saving
	public let protectContent: Bool?
	
	///Optional. If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?
	
	///Optional. Pass True if the message should be sent even if the specified replied-to message is not found
	public let allowSendingWithoutReply: Bool?
	
	///Optional. A JSON-serialized object for an inline keyboard. If empty, one 'Play game_title' button will be shown. If not empty, the first button must launch the game.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramInteger,
		messageThreadId: TelegramInteger? = nil,
		gameShortName: String,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.gameShortName = gameShortName
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	private enum CodingKeys: String, CodingKey {
		case chatId = "chat_id"
		case messageThreadId = "message_thread_id"
		case gameShortName = "game_short_name"
		case disableNotification = "disable_notification"
		case protectContent = "protect_content"
		case replyToMessageId = "reply_to_message_id"
		case allowSendingWithoutReply = "allow_sending_without_reply"
		case replyMarkup = "reply_markup"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.chatId.self, forKey: .chatId)
		try container.encodeIfPresent(self.messageThreadId.self, forKey: .messageThreadId)
		try container.encode(self.gameShortName.self, forKey: .gameShortName)
		try container.encodeIfPresent(self.disableNotification.self, forKey: .disableNotification)
		try container.encodeIfPresent(self.protectContent.self, forKey: .protectContent)
		try container.encodeIfPresent(self.replyToMessageId.self, forKey: .replyToMessageId)
		try container.encodeIfPresent(self.allowSendingWithoutReply.self, forKey: .allowSendingWithoutReply)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.chatId = try container.decode(TelegramInteger.self, forKey: .chatId)
		self.messageThreadId = try container.decodeIfPresent(TelegramInteger.self, forKey: .messageThreadId)
		self.gameShortName = try container.decode(String.self, forKey: .gameShortName)
		self.disableNotification = try container.decodeIfPresent(Bool.self, forKey: .disableNotification)
		self.protectContent = try container.decodeIfPresent(Bool.self, forKey: .protectContent)
		self.replyToMessageId = try container.decodeIfPresent(TelegramInteger.self, forKey: .replyToMessageId)
		self.allowSendingWithoutReply = try container.decodeIfPresent(Bool.self, forKey: .allowSendingWithoutReply)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
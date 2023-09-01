extension TelegramAPI {
    /// Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.
    public func setGameScore(_ input: SetGameScoreInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("setGameScore", object: input, completion: completionHandler)
    }
}

//Input model for request setGameScore
import Foundation
public final class SetGameScoreInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. User identifier
	public let userId: TelegramInteger
	
	///Yes. New score, must be non-negative
	public let score: TelegramInteger
	
	///Optional. Pass True if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
	public let force: Bool?
	
	///Optional. Pass True if the game message should not be automatically edited to include the current scoreboard
	public let disableEditMessage: Bool?
	
	///Optional. Required if inline_message_id is not specified. Unique identifier for the target chat
	public let chatId: TelegramInteger?
	
	///Optional. Required if inline_message_id is not specified. Identifier of the sent message
	public let messageId: TelegramInteger?
	
	///Optional. Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	public init(
		userId: TelegramInteger,
		score: TelegramInteger,
		force: Bool? = nil,
		disableEditMessage: Bool? = nil,
		chatId: TelegramInteger? = nil,
		messageId: TelegramInteger? = nil,
		inlineMessageId: String? = nil
	) {
		self.userId = userId
		self.score = score
		self.force = force
		self.disableEditMessage = disableEditMessage
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
	}

	private enum CodingKeys: String, CodingKey {
		case userId = "user_id"
		case score
		case force
		case disableEditMessage = "disable_edit_message"
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.userId.self, forKey: .userId)
		try container.encode(self.score.self, forKey: .score)
		try container.encodeIfPresent(self.force.self, forKey: .force)
		try container.encodeIfPresent(self.disableEditMessage.self, forKey: .disableEditMessage)
		try container.encodeIfPresent(self.chatId.self, forKey: .chatId)
		try container.encodeIfPresent(self.messageId.self, forKey: .messageId)
		try container.encodeIfPresent(self.inlineMessageId.self, forKey: .inlineMessageId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
		self.score = try container.decode(TelegramInteger.self, forKey: .score)
		self.force = try container.decodeIfPresent(Bool.self, forKey: .force)
		self.disableEditMessage = try container.decodeIfPresent(Bool.self, forKey: .disableEditMessage)
		self.chatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .chatId)
		self.messageId = try container.decodeIfPresent(TelegramInteger.self, forKey: .messageId)
		self.inlineMessageId = try container.decodeIfPresent(String.self, forKey: .inlineMessageId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
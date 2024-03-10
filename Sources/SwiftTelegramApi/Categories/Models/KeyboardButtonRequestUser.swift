import Foundation
public final class KeyboardButtonRequestUser: Codable, IMultiPartFromDataValueEncodable {
	///Signed 32-bit identifier of the request, which will be received back in the UserShared object. Must be unique within the message
	public let requestId: TelegramInteger
	
	///Optional. Pass True to request a bot, pass False to request a regular user. If not specified, no additional restrictions are applied.
	public let userIsBot: Bool?
	
	///Optional. Pass True to request a premium user, pass False to request a non-premium user. If not specified, no additional restrictions are applied.
	public let userIsPremium: Bool?

	public init(
		requestId: TelegramInteger,
		userIsBot: Bool? = nil,
		userIsPremium: Bool? = nil
	) {
		self.requestId = requestId
		self.userIsBot = userIsBot
		self.userIsPremium = userIsPremium
	}

	private enum CodingKeys: String, CodingKey {
		case requestId = "request_id"
		case userIsBot = "user_is_bot"
		case userIsPremium = "user_is_premium"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.requestId.self, forKey: .requestId)
		try container.encodeIfPresent(self.userIsBot.self, forKey: .userIsBot)
		try container.encodeIfPresent(self.userIsPremium.self, forKey: .userIsPremium)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.requestId = try container.decode(TelegramInteger.self, forKey: .requestId)
		self.userIsBot = try container.decodeIfPresent(Bool.self, forKey: .userIsBot)
		self.userIsPremium = try container.decodeIfPresent(Bool.self, forKey: .userIsPremium)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
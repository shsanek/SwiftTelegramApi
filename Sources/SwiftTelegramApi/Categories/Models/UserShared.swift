import Foundation
public final class UserShared: Codable, IMultiPartFromDataValueEncodable {
	///Identifier of the request
	public let requestId: TelegramInteger
	
	///Identifier of the shared user. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. The bot may not have access to the user and could be unable to use this identifier, unless the user is already known to the bot by some other means.
	public let userId: TelegramInteger

	public init(
		requestId: TelegramInteger,
		userId: TelegramInteger
	) {
		self.requestId = requestId
		self.userId = userId
	}

	private enum CodingKeys: String, CodingKey {
		case requestId = "request_id"
		case userId = "user_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.requestId.self, forKey: .requestId)
		try container.encode(self.userId.self, forKey: .userId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.requestId = try container.decode(TelegramInteger.self, forKey: .requestId)
		self.userId = try container.decode(TelegramInteger.self, forKey: .userId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class GameHighScore: Codable, IMultiPartFromDataValueEncodable {
	///Position in high score table for the game
	public let position: TelegramInteger
	
	///User
	public let user: User
	
	///Score
	public let score: TelegramInteger

	public init(
		position: TelegramInteger,
		user: User,
		score: TelegramInteger
	) {
		self.position = position
		self.user = user
		self.score = score
	}

	private enum CodingKeys: String, CodingKey {
		case position
		case user
		case score
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.position.self, forKey: .position)
		try container.encode(self.user.self, forKey: .user)
		try container.encode(self.score.self, forKey: .score)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.position = try container.decode(TelegramInteger.self, forKey: .position)
		self.user = try container.decode(User.self, forKey: .user)
		self.score = try container.decode(TelegramInteger.self, forKey: .score)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
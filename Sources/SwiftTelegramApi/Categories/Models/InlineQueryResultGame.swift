import Foundation
public final class InlineQueryResultGame: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be game
	public let type: String
	
	///Unique identifier for this result, 1-64 bytes
	public let id: String
	
	///Short name of the game
	public let gameShortName: String
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		type: String,
		id: String,
		gameShortName: String,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.type = type
		self.id = id
		self.gameShortName = gameShortName
		self.replyMarkup = replyMarkup
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case gameShortName = "game_short_name"
		case replyMarkup = "reply_markup"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.gameShortName.self, forKey: .gameShortName)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.gameShortName = try container.decode(String.self, forKey: .gameShortName)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
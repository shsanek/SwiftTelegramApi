import Foundation
public final class BotDescription: Codable, IMultiPartFromDataValueEncodable {
	///The bot's description
	public let description: String

	public init(
		description: String
	) {
		self.description = description
	}

	private enum CodingKeys: String, CodingKey {
		case description
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.description.self, forKey: .description)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.description = try container.decode(String.self, forKey: .description)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
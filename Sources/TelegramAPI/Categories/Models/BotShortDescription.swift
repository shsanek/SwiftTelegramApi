import Foundation
public final class BotShortDescription: Codable, IMultiPartFromDataValueEncodable {
	///The bot's short description
	public let shortDescription: String

	public init(
		shortDescription: String
	) {
		self.shortDescription = shortDescription
	}

	private enum CodingKeys: String, CodingKey {
		case shortDescription = "short_description"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.shortDescription.self, forKey: .shortDescription)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.shortDescription = try container.decode(String.self, forKey: .shortDescription)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
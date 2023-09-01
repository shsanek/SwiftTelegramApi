import Foundation
public final class PassportElementErrorUnspecified: Codable, IMultiPartFromDataValueEncodable {
	///Error source, must be unspecified
	public let source: String
	
	///Type of element of the user's Telegram Passport which has the issue
	public let type: String
	
	///Base64-encoded element hash
	public let elementHash: String
	
	///Error message
	public let message: String

	public init(
		source: String,
		type: String,
		elementHash: String,
		message: String
	) {
		self.source = source
		self.type = type
		self.elementHash = elementHash
		self.message = message
	}

	private enum CodingKeys: String, CodingKey {
		case source
		case type
		case elementHash = "element_hash"
		case message
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.source.self, forKey: .source)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.elementHash.self, forKey: .elementHash)
		try container.encode(self.message.self, forKey: .message)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.source = try container.decode(String.self, forKey: .source)
		self.type = try container.decode(String.self, forKey: .type)
		self.elementHash = try container.decode(String.self, forKey: .elementHash)
		self.message = try container.decode(String.self, forKey: .message)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
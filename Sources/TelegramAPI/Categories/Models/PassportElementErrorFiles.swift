import Foundation
public final class PassportElementErrorFiles: Codable, IMultiPartFromDataValueEncodable {
	///Error source, must be files
	public let source: String
	
	///The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
	public let type: String
	
	///List of base64-encoded file hashes
	public let fileHashes: [String]
	
	///Error message
	public let message: String

	public init(
		source: String,
		type: String,
		fileHashes: [String],
		message: String
	) {
		self.source = source
		self.type = type
		self.fileHashes = fileHashes
		self.message = message
	}

	private enum CodingKeys: String, CodingKey {
		case source
		case type
		case fileHashes = "file_hashes"
		case message
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.source.self, forKey: .source)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.fileHashes.self, forKey: .fileHashes)
		try container.encode(self.message.self, forKey: .message)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.source = try container.decode(String.self, forKey: .source)
		self.type = try container.decode(String.self, forKey: .type)
		self.fileHashes = try container.decode([String].self, forKey: .fileHashes)
		self.message = try container.decode(String.self, forKey: .message)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class PassportElementErrorTranslationFile: Codable, IMultiPartFromDataValueEncodable {
	///Error source, must be translation_file
	public let source: String
	
	///Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
	public let type: String
	
	///Base64-encoded file hash
	public let fileHash: String
	
	///Error message
	public let message: String

	public init(
		source: String,
		type: String,
		fileHash: String,
		message: String
	) {
		self.source = source
		self.type = type
		self.fileHash = fileHash
		self.message = message
	}

	private enum CodingKeys: String, CodingKey {
		case source
		case type
		case fileHash = "file_hash"
		case message
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.source.self, forKey: .source)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.fileHash.self, forKey: .fileHash)
		try container.encode(self.message.self, forKey: .message)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.source = try container.decode(String.self, forKey: .source)
		self.type = try container.decode(String.self, forKey: .type)
		self.fileHash = try container.decode(String.self, forKey: .fileHash)
		self.message = try container.decode(String.self, forKey: .message)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
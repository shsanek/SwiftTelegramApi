public final class PassportElementErrorTranslationFiles: Codable, IMultiPartFromDataEncodable {
	///Error source, must be translation_files
	public let source: String
	
	///Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”
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

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("source", object: self.source)
		encoder.append("type", object: self.type)
		encoder.append("file_hashes", object: self.fileHashes)
		encoder.append("message", object: self.message)
	}
}
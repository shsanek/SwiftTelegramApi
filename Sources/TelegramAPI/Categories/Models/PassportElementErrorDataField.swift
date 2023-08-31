public final class PassportElementErrorDataField: Codable, IMultiPartFromDataEncodable {
	///Error source, must be data
	public let source: String
	
	///The section of the user's Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”
	public let type: String
	
	///Name of the data field which has the error
	public let fieldName: String
	
	///Base64-encoded data hash
	public let dataHash: String
	
	///Error message
	public let message: String

	public init(
		source: String,
		type: String,
		fieldName: String,
		dataHash: String,
		message: String
	) {
		self.source = source
		self.type = type
		self.fieldName = fieldName
		self.dataHash = dataHash
		self.message = message
	}

	private enum CodingKeys: String, CodingKey {
		case source
		case type
		case fieldName = "field_name"
		case dataHash = "data_hash"
		case message
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.source.self, forKey: .source)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.fieldName.self, forKey: .fieldName)
		try container.encode(self.dataHash.self, forKey: .dataHash)
		try container.encode(self.message.self, forKey: .message)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.source = try container.decode(String.self, forKey: .source)
		self.type = try container.decode(String.self, forKey: .type)
		self.fieldName = try container.decode(String.self, forKey: .fieldName)
		self.dataHash = try container.decode(String.self, forKey: .dataHash)
		self.message = try container.decode(String.self, forKey: .message)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("source", object: self.source)
		encoder.append("type", object: self.type)
		encoder.append("field_name", object: self.fieldName)
		encoder.append("data_hash", object: self.dataHash)
		encoder.append("message", object: self.message)
	}
}
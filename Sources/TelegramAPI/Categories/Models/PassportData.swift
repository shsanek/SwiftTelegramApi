public final class PassportData: Codable, IMultiPartFromDataEncodable {
	///Array with information about documents and other Telegram Passport elements that was shared with the bot
	public let data: [EncryptedPassportElement]
	
	///Encrypted credentials required to decrypt the data
	public let credentials: EncryptedCredentials

	public init(
		data: [EncryptedPassportElement],
		credentials: EncryptedCredentials
	) {
		self.data = data
		self.credentials = credentials
	}

	private enum CodingKeys: String, CodingKey {
		case data
		case credentials
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.data.self, forKey: .data)
		try container.encode(self.credentials.self, forKey: .credentials)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.data = try container.decode([EncryptedPassportElement].self, forKey: .data)
		self.credentials = try container.decode(EncryptedCredentials.self, forKey: .credentials)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("data", object: self.data)
		encoder.append("credentials", object: self.credentials)
	}
}
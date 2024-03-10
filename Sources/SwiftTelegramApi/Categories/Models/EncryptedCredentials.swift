import Foundation
public final class EncryptedCredentials: Codable, IMultiPartFromDataValueEncodable {
	///Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication
	public let data: String
	
	///Base64-encoded data hash for data authentication
	public let hash: String
	
	///Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
	public let secret: String

	public init(
		data: String,
		hash: String,
		secret: String
	) {
		self.data = data
		self.hash = hash
		self.secret = secret
	}

	private enum CodingKeys: String, CodingKey {
		case data
		case hash
		case secret
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.data.self, forKey: .data)
		try container.encode(self.hash.self, forKey: .hash)
		try container.encode(self.secret.self, forKey: .secret)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.data = try container.decode(String.self, forKey: .data)
		self.hash = try container.decode(String.self, forKey: .hash)
		self.secret = try container.decode(String.self, forKey: .secret)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
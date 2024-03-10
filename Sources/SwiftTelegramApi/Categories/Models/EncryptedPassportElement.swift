import Foundation
public final class EncryptedPassportElement: Codable, IMultiPartFromDataValueEncodable {
	///Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.
	public let type: String
	
	///Optional. Base64-encoded encrypted Telegram Passport element data provided by the user, available for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.
	public let data: String?
	
	///Optional. User's verified phone number, available only for “phone_number” type
	public let phoneNumber: String?
	
	///Optional. User's verified email address, available only for “email” type
	public let email: String?
	
	///Optional. Array of encrypted files with documents provided by the user, available for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
	public let files: [PassportFile]?
	
	///Optional. Encrypted file with the front side of the document, provided by the user. Available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
	public let frontSide: PassportFile?
	
	///Optional. Encrypted file with the reverse side of the document, provided by the user. Available for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
	public let reverseSide: PassportFile?
	
	///Optional. Encrypted file with the selfie of the user holding a document, provided by the user; available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
	public let selfie: PassportFile?
	
	///Optional. Array of encrypted files with translated versions of documents provided by the user. Available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
	public let translation: [PassportFile]?
	
	///Base64-encoded element hash for using in PassportElementErrorUnspecified
	public let hash: String

	public init(
		type: String,
		data: String? = nil,
		phoneNumber: String? = nil,
		email: String? = nil,
		files: [PassportFile]? = nil,
		frontSide: PassportFile? = nil,
		reverseSide: PassportFile? = nil,
		selfie: PassportFile? = nil,
		translation: [PassportFile]? = nil,
		hash: String
	) {
		self.type = type
		self.data = data
		self.phoneNumber = phoneNumber
		self.email = email
		self.files = files
		self.frontSide = frontSide
		self.reverseSide = reverseSide
		self.selfie = selfie
		self.translation = translation
		self.hash = hash
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case data
		case phoneNumber = "phone_number"
		case email
		case files
		case frontSide = "front_side"
		case reverseSide = "reverse_side"
		case selfie
		case translation
		case hash
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encodeIfPresent(self.data.self, forKey: .data)
		try container.encodeIfPresent(self.phoneNumber.self, forKey: .phoneNumber)
		try container.encodeIfPresent(self.email.self, forKey: .email)
		try container.encodeIfPresent(self.files.self, forKey: .files)
		try container.encodeIfPresent(self.frontSide.self, forKey: .frontSide)
		try container.encodeIfPresent(self.reverseSide.self, forKey: .reverseSide)
		try container.encodeIfPresent(self.selfie.self, forKey: .selfie)
		try container.encodeIfPresent(self.translation.self, forKey: .translation)
		try container.encode(self.hash.self, forKey: .hash)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.data = try container.decodeIfPresent(String.self, forKey: .data)
		self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
		self.email = try container.decodeIfPresent(String.self, forKey: .email)
		self.files = try container.decodeIfPresent([PassportFile].self, forKey: .files)
		self.frontSide = try container.decodeIfPresent(PassportFile.self, forKey: .frontSide)
		self.reverseSide = try container.decodeIfPresent(PassportFile.self, forKey: .reverseSide)
		self.selfie = try container.decodeIfPresent(PassportFile.self, forKey: .selfie)
		self.translation = try container.decodeIfPresent([PassportFile].self, forKey: .translation)
		self.hash = try container.decode(String.self, forKey: .hash)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class Contact: Codable, IMultiPartFromDataValueEncodable {
	///Contact's phone number
	public let phoneNumber: String
	
	///Contact's first name
	public let firstName: String
	
	///Optional. Contact's last name
	public let lastName: String?
	
	///Optional. Contact's user identifier in Telegram. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier.
	public let userId: TelegramInteger?
	
	///Optional. Additional data about the contact in the form of a vCard
	public let vcard: String?

	public init(
		phoneNumber: String,
		firstName: String,
		lastName: String? = nil,
		userId: TelegramInteger? = nil,
		vcard: String? = nil
	) {
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.userId = userId
		self.vcard = vcard
	}

	private enum CodingKeys: String, CodingKey {
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case userId = "user_id"
		case vcard
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.phoneNumber.self, forKey: .phoneNumber)
		try container.encode(self.firstName.self, forKey: .firstName)
		try container.encodeIfPresent(self.lastName.self, forKey: .lastName)
		try container.encodeIfPresent(self.userId.self, forKey: .userId)
		try container.encodeIfPresent(self.vcard.self, forKey: .vcard)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
		self.firstName = try container.decode(String.self, forKey: .firstName)
		self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
		self.userId = try container.decodeIfPresent(TelegramInteger.self, forKey: .userId)
		self.vcard = try container.decodeIfPresent(String.self, forKey: .vcard)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
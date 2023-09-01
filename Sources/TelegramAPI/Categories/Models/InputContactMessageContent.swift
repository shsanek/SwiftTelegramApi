import Foundation
public final class InputContactMessageContent: Codable, IMultiPartFromDataValueEncodable {
	///Contact's phone number
	public let phoneNumber: String
	
	///Contact's first name
	public let firstName: String
	
	///Optional. Contact's last name
	public let lastName: String?
	
	///Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
	public let vcard: String?

	public init(
		phoneNumber: String,
		firstName: String,
		lastName: String? = nil,
		vcard: String? = nil
	) {
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.vcard = vcard
	}

	private enum CodingKeys: String, CodingKey {
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case vcard
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.phoneNumber.self, forKey: .phoneNumber)
		try container.encode(self.firstName.self, forKey: .firstName)
		try container.encodeIfPresent(self.lastName.self, forKey: .lastName)
		try container.encodeIfPresent(self.vcard.self, forKey: .vcard)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
		self.firstName = try container.decode(String.self, forKey: .firstName)
		self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
		self.vcard = try container.decodeIfPresent(String.self, forKey: .vcard)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
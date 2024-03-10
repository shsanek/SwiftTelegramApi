import Foundation
public final class OrderInfo: Codable, IMultiPartFromDataValueEncodable {
	///Optional. User name
	public let name: String?
	
	///Optional. User's phone number
	public let phoneNumber: String?
	
	///Optional. User email
	public let email: String?
	
	///Optional. User shipping address
	public let shippingAddress: ShippingAddress?

	public init(
		name: String? = nil,
		phoneNumber: String? = nil,
		email: String? = nil,
		shippingAddress: ShippingAddress? = nil
	) {
		self.name = name
		self.phoneNumber = phoneNumber
		self.email = email
		self.shippingAddress = shippingAddress
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case phoneNumber = "phone_number"
		case email
		case shippingAddress = "shipping_address"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.name.self, forKey: .name)
		try container.encodeIfPresent(self.phoneNumber.self, forKey: .phoneNumber)
		try container.encodeIfPresent(self.email.self, forKey: .email)
		try container.encodeIfPresent(self.shippingAddress.self, forKey: .shippingAddress)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
		self.email = try container.decodeIfPresent(String.self, forKey: .email)
		self.shippingAddress = try container.decodeIfPresent(ShippingAddress.self, forKey: .shippingAddress)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
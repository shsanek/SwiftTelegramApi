public final class ShippingAddress: Codable, IMultiPartFromDataEncodable {
	///Two-letter ISO 3166-1 alpha-2 country code
	public let countryCode: String
	
	///State, if applicable
	public let state: String
	
	///City
	public let city: String
	
	///First line for the address
	public let streetLine1: String
	
	///Second line for the address
	public let streetLine2: String
	
	///Address post code
	public let postCode: String

	public init(
		countryCode: String,
		state: String,
		city: String,
		streetLine1: String,
		streetLine2: String,
		postCode: String
	) {
		self.countryCode = countryCode
		self.state = state
		self.city = city
		self.streetLine1 = streetLine1
		self.streetLine2 = streetLine2
		self.postCode = postCode
	}

	private enum CodingKeys: String, CodingKey {
		case countryCode = "country_code"
		case state
		case city
		case streetLine1 = "street_line1"
		case streetLine2 = "street_line2"
		case postCode = "post_code"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.countryCode.self, forKey: .countryCode)
		try container.encode(self.state.self, forKey: .state)
		try container.encode(self.city.self, forKey: .city)
		try container.encode(self.streetLine1.self, forKey: .streetLine1)
		try container.encode(self.streetLine2.self, forKey: .streetLine2)
		try container.encode(self.postCode.self, forKey: .postCode)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.countryCode = try container.decode(String.self, forKey: .countryCode)
		self.state = try container.decode(String.self, forKey: .state)
		self.city = try container.decode(String.self, forKey: .city)
		self.streetLine1 = try container.decode(String.self, forKey: .streetLine1)
		self.streetLine2 = try container.decode(String.self, forKey: .streetLine2)
		self.postCode = try container.decode(String.self, forKey: .postCode)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("country_code", object: self.countryCode)
		encoder.append("state", object: self.state)
		encoder.append("city", object: self.city)
		encoder.append("street_line1", object: self.streetLine1)
		encoder.append("street_line2", object: self.streetLine2)
		encoder.append("post_code", object: self.postCode)
	}
}
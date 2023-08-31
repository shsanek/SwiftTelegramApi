public final class ShippingQuery: Codable, IMultiPartFromDataEncodable {
	///Unique query identifier
	public let id: String
	
	///User who sent the query
	public let from: User
	
	///Bot specified invoice payload
	public let invoicePayload: String
	
	///User specified shipping address
	public let shippingAddress: ShippingAddress

	public init(
		id: String,
		from: User,
		invoicePayload: String,
		shippingAddress: ShippingAddress
	) {
		self.id = id
		self.from = from
		self.invoicePayload = invoicePayload
		self.shippingAddress = shippingAddress
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case from
		case invoicePayload = "invoice_payload"
		case shippingAddress = "shipping_address"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.from.self, forKey: .from)
		try container.encode(self.invoicePayload.self, forKey: .invoicePayload)
		try container.encode(self.shippingAddress.self, forKey: .shippingAddress)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .id)
		self.from = try container.decode(User.self, forKey: .from)
		self.invoicePayload = try container.decode(String.self, forKey: .invoicePayload)
		self.shippingAddress = try container.decode(ShippingAddress.self, forKey: .shippingAddress)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("id", object: self.id)
		encoder.append("from", object: self.from)
		encoder.append("invoice_payload", object: self.invoicePayload)
		encoder.append("shipping_address", object: self.shippingAddress)
	}
}
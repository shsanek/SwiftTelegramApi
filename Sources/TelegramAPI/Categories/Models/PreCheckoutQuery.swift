public final class PreCheckoutQuery: Codable, IMultiPartFromDataEncodable {
	///Unique query identifier
	public let id: String
	
	///User who sent the query
	public let from: User
	
	///Three-letter ISO 4217 currency code
	public let currency: String
	
	///Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	public let totalAmount: TelegramInteger
	
	///Bot specified invoice payload
	public let invoicePayload: String
	
	///Optional. Identifier of the shipping option chosen by the user
	public let shippingOptionId: String?
	
	///Optional. Order information provided by the user
	public let orderInfo: OrderInfo?

	public init(
		id: String,
		from: User,
		currency: String,
		totalAmount: TelegramInteger,
		invoicePayload: String,
		shippingOptionId: String? = nil,
		orderInfo: OrderInfo? = nil
	) {
		self.id = id
		self.from = from
		self.currency = currency
		self.totalAmount = totalAmount
		self.invoicePayload = invoicePayload
		self.shippingOptionId = shippingOptionId
		self.orderInfo = orderInfo
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case from
		case currency
		case totalAmount = "total_amount"
		case invoicePayload = "invoice_payload"
		case shippingOptionId = "shipping_option_id"
		case orderInfo = "order_info"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.from.self, forKey: .from)
		try container.encode(self.currency.self, forKey: .currency)
		try container.encode(self.totalAmount.self, forKey: .totalAmount)
		try container.encode(self.invoicePayload.self, forKey: .invoicePayload)
		try container.encodeIfPresent(self.shippingOptionId.self, forKey: .shippingOptionId)
		try container.encodeIfPresent(self.orderInfo.self, forKey: .orderInfo)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .id)
		self.from = try container.decode(User.self, forKey: .from)
		self.currency = try container.decode(String.self, forKey: .currency)
		self.totalAmount = try container.decode(TelegramInteger.self, forKey: .totalAmount)
		self.invoicePayload = try container.decode(String.self, forKey: .invoicePayload)
		self.shippingOptionId = try container.decodeIfPresent(String.self, forKey: .shippingOptionId)
		self.orderInfo = try container.decodeIfPresent(OrderInfo.self, forKey: .orderInfo)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("id", object: self.id)
		encoder.append("from", object: self.from)
		encoder.append("currency", object: self.currency)
		encoder.append("total_amount", object: self.totalAmount)
		encoder.append("invoice_payload", object: self.invoicePayload)
		encoder.append("shipping_option_id", object: self.shippingOptionId)
		encoder.append("order_info", object: self.orderInfo)
	}
}
import Foundation
public final class SuccessfulPayment: Codable, IMultiPartFromDataValueEncodable {
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
	
	///Telegram payment identifier
	public let telegramPaymentChargeId: String
	
	///Provider payment identifier
	public let providerPaymentChargeId: String

	public init(
		currency: String,
		totalAmount: TelegramInteger,
		invoicePayload: String,
		shippingOptionId: String? = nil,
		orderInfo: OrderInfo? = nil,
		telegramPaymentChargeId: String,
		providerPaymentChargeId: String
	) {
		self.currency = currency
		self.totalAmount = totalAmount
		self.invoicePayload = invoicePayload
		self.shippingOptionId = shippingOptionId
		self.orderInfo = orderInfo
		self.telegramPaymentChargeId = telegramPaymentChargeId
		self.providerPaymentChargeId = providerPaymentChargeId
	}

	private enum CodingKeys: String, CodingKey {
		case currency
		case totalAmount = "total_amount"
		case invoicePayload = "invoice_payload"
		case shippingOptionId = "shipping_option_id"
		case orderInfo = "order_info"
		case telegramPaymentChargeId = "telegram_payment_charge_id"
		case providerPaymentChargeId = "provider_payment_charge_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.currency.self, forKey: .currency)
		try container.encode(self.totalAmount.self, forKey: .totalAmount)
		try container.encode(self.invoicePayload.self, forKey: .invoicePayload)
		try container.encodeIfPresent(self.shippingOptionId.self, forKey: .shippingOptionId)
		try container.encodeIfPresent(self.orderInfo.self, forKey: .orderInfo)
		try container.encode(self.telegramPaymentChargeId.self, forKey: .telegramPaymentChargeId)
		try container.encode(self.providerPaymentChargeId.self, forKey: .providerPaymentChargeId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.currency = try container.decode(String.self, forKey: .currency)
		self.totalAmount = try container.decode(TelegramInteger.self, forKey: .totalAmount)
		self.invoicePayload = try container.decode(String.self, forKey: .invoicePayload)
		self.shippingOptionId = try container.decodeIfPresent(String.self, forKey: .shippingOptionId)
		self.orderInfo = try container.decodeIfPresent(OrderInfo.self, forKey: .orderInfo)
		self.telegramPaymentChargeId = try container.decode(String.self, forKey: .telegramPaymentChargeId)
		self.providerPaymentChargeId = try container.decode(String.self, forKey: .providerPaymentChargeId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
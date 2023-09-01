import Foundation
public final class Invoice: Codable, IMultiPartFromDataValueEncodable {
	///Product name
	public let title: String
	
	///Product description
	public let description: String
	
	///Unique bot deep-linking parameter that can be used to generate this invoice
	public let startParameter: String
	
	///Three-letter ISO 4217 currency code
	public let currency: String
	
	///Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	public let totalAmount: TelegramInteger

	public init(
		title: String,
		description: String,
		startParameter: String,
		currency: String,
		totalAmount: TelegramInteger
	) {
		self.title = title
		self.description = description
		self.startParameter = startParameter
		self.currency = currency
		self.totalAmount = totalAmount
	}

	private enum CodingKeys: String, CodingKey {
		case title
		case description
		case startParameter = "start_parameter"
		case currency
		case totalAmount = "total_amount"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.description.self, forKey: .description)
		try container.encode(self.startParameter.self, forKey: .startParameter)
		try container.encode(self.currency.self, forKey: .currency)
		try container.encode(self.totalAmount.self, forKey: .totalAmount)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decode(String.self, forKey: .description)
		self.startParameter = try container.decode(String.self, forKey: .startParameter)
		self.currency = try container.decode(String.self, forKey: .currency)
		self.totalAmount = try container.decode(TelegramInteger.self, forKey: .totalAmount)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class LabeledPrice: Codable, IMultiPartFromDataValueEncodable {
	///Portion label
	public let label: String
	
	///Price of the product in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	public let amount: TelegramInteger

	public init(
		label: String,
		amount: TelegramInteger
	) {
		self.label = label
		self.amount = amount
	}

	private enum CodingKeys: String, CodingKey {
		case label
		case amount
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.label.self, forKey: .label)
		try container.encode(self.amount.self, forKey: .amount)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.label = try container.decode(String.self, forKey: .label)
		self.amount = try container.decode(TelegramInteger.self, forKey: .amount)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
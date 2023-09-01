import Foundation
public final class ShippingOption: Codable, IMultiPartFromDataValueEncodable {
	///Shipping option identifier
	public let id: String
	
	///Option title
	public let title: String
	
	///List of price portions
	public let prices: [LabeledPrice]

	public init(
		id: String,
		title: String,
		prices: [LabeledPrice]
	) {
		self.id = id
		self.title = title
		self.prices = prices
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case title
		case prices
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.prices.self, forKey: .prices)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .id)
		self.title = try container.decode(String.self, forKey: .title)
		self.prices = try container.decode([LabeledPrice].self, forKey: .prices)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
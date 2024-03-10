import Foundation
public final class ChatLocation: Codable, IMultiPartFromDataValueEncodable {
	///The location to which the supergroup is connected. Can't be a live location.
	public let location: Location
	
	///Location address; 1-64 characters, as defined by the chat owner
	public let address: String

	public init(
		location: Location,
		address: String
	) {
		self.location = location
		self.address = address
	}

	private enum CodingKeys: String, CodingKey {
		case location
		case address
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.location.self, forKey: .location)
		try container.encode(self.address.self, forKey: .address)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.location = try container.decode(Location.self, forKey: .location)
		self.address = try container.decode(String.self, forKey: .address)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class ProximityAlertTriggered: Codable, IMultiPartFromDataValueEncodable {
	///User that triggered the alert
	public let traveler: User
	
	///User that set the alert
	public let watcher: User
	
	///The distance between the users
	public let distance: TelegramInteger

	public init(
		traveler: User,
		watcher: User,
		distance: TelegramInteger
	) {
		self.traveler = traveler
		self.watcher = watcher
		self.distance = distance
	}

	private enum CodingKeys: String, CodingKey {
		case traveler
		case watcher
		case distance
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.traveler.self, forKey: .traveler)
		try container.encode(self.watcher.self, forKey: .watcher)
		try container.encode(self.distance.self, forKey: .distance)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.traveler = try container.decode(User.self, forKey: .traveler)
		self.watcher = try container.decode(User.self, forKey: .watcher)
		self.distance = try container.decode(TelegramInteger.self, forKey: .distance)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
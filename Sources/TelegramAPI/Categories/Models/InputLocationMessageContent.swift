import Foundation
public final class InputLocationMessageContent: Codable, IMultiPartFromDataValueEncodable {
	///Latitude of the location in degrees
	public let latitude: TelegramFloat
	
	///Longitude of the location in degrees
	public let longitude: TelegramFloat
	
	///Optional. The radius of uncertainty for the location, measured in meters; 0-1500
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	public let livePeriod: TelegramInteger?
	
	///Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
	public let heading: TelegramInteger?
	
	///Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
	public let proximityAlertRadius: TelegramInteger?

	public init(
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		horizontalAccuracy: TelegramFloat? = nil,
		livePeriod: TelegramInteger? = nil,
		heading: TelegramInteger? = nil,
		proximityAlertRadius: TelegramInteger? = nil
	) {
		self.latitude = latitude
		self.longitude = longitude
		self.horizontalAccuracy = horizontalAccuracy
		self.livePeriod = livePeriod
		self.heading = heading
		self.proximityAlertRadius = proximityAlertRadius
	}

	private enum CodingKeys: String, CodingKey {
		case latitude
		case longitude
		case horizontalAccuracy = "horizontal_accuracy"
		case livePeriod = "live_period"
		case heading
		case proximityAlertRadius = "proximity_alert_radius"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.latitude.self, forKey: .latitude)
		try container.encode(self.longitude.self, forKey: .longitude)
		try container.encodeIfPresent(self.horizontalAccuracy.self, forKey: .horizontalAccuracy)
		try container.encodeIfPresent(self.livePeriod.self, forKey: .livePeriod)
		try container.encodeIfPresent(self.heading.self, forKey: .heading)
		try container.encodeIfPresent(self.proximityAlertRadius.self, forKey: .proximityAlertRadius)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.latitude = try container.decode(TelegramFloat.self, forKey: .latitude)
		self.longitude = try container.decode(TelegramFloat.self, forKey: .longitude)
		self.horizontalAccuracy = try container.decodeIfPresent(TelegramFloat.self, forKey: .horizontalAccuracy)
		self.livePeriod = try container.decodeIfPresent(TelegramInteger.self, forKey: .livePeriod)
		self.heading = try container.decodeIfPresent(TelegramInteger.self, forKey: .heading)
		self.proximityAlertRadius = try container.decodeIfPresent(TelegramInteger.self, forKey: .proximityAlertRadius)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
public final class Location: Codable, IMultiPartFromDataEncodable {
	///Longitude as defined by sender
	public let longitude: TelegramFloat
	
	///Latitude as defined by sender
	public let latitude: TelegramFloat
	
	///Optional. The radius of uncertainty for the location, measured in meters; 0-1500
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional. Time relative to the message sending date, during which the location can be updated; in seconds. For active live locations only.
	public let livePeriod: TelegramInteger?
	
	///Optional. The direction in which user is moving, in degrees; 1-360. For active live locations only.
	public let heading: TelegramInteger?
	
	///Optional. The maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only.
	public let proximityAlertRadius: TelegramInteger?

	public init(
		longitude: TelegramFloat,
		latitude: TelegramFloat,
		horizontalAccuracy: TelegramFloat? = nil,
		livePeriod: TelegramInteger? = nil,
		heading: TelegramInteger? = nil,
		proximityAlertRadius: TelegramInteger? = nil
	) {
		self.longitude = longitude
		self.latitude = latitude
		self.horizontalAccuracy = horizontalAccuracy
		self.livePeriod = livePeriod
		self.heading = heading
		self.proximityAlertRadius = proximityAlertRadius
	}

	private enum CodingKeys: String, CodingKey {
		case longitude
		case latitude
		case horizontalAccuracy = "horizontal_accuracy"
		case livePeriod = "live_period"
		case heading
		case proximityAlertRadius = "proximity_alert_radius"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.longitude.self, forKey: .longitude)
		try container.encode(self.latitude.self, forKey: .latitude)
		try container.encodeIfPresent(self.horizontalAccuracy.self, forKey: .horizontalAccuracy)
		try container.encodeIfPresent(self.livePeriod.self, forKey: .livePeriod)
		try container.encodeIfPresent(self.heading.self, forKey: .heading)
		try container.encodeIfPresent(self.proximityAlertRadius.self, forKey: .proximityAlertRadius)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.longitude = try container.decode(TelegramFloat.self, forKey: .longitude)
		self.latitude = try container.decode(TelegramFloat.self, forKey: .latitude)
		self.horizontalAccuracy = try container.decodeIfPresent(TelegramFloat.self, forKey: .horizontalAccuracy)
		self.livePeriod = try container.decodeIfPresent(TelegramInteger.self, forKey: .livePeriod)
		self.heading = try container.decodeIfPresent(TelegramInteger.self, forKey: .heading)
		self.proximityAlertRadius = try container.decodeIfPresent(TelegramInteger.self, forKey: .proximityAlertRadius)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("longitude", object: self.longitude)
		encoder.append("latitude", object: self.latitude)
		encoder.append("horizontal_accuracy", object: self.horizontalAccuracy)
		encoder.append("live_period", object: self.livePeriod)
		encoder.append("heading", object: self.heading)
		encoder.append("proximity_alert_radius", object: self.proximityAlertRadius)
	}
}
public final class InlineQueryResultLocation: Codable, IMultiPartFromDataEncodable {
	///Type of the result, must be location
	public let type: String
	
	///Unique identifier for this result, 1-64 Bytes
	public let id: String
	
	///Location latitude in degrees
	public let latitude: TelegramFloat
	
	///Location longitude in degrees
	public let longitude: TelegramFloat
	
	///Location title
	public let title: String
	
	///Optional. The radius of uncertainty for the location, measured in meters; 0-1500
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	public let livePeriod: TelegramInteger?
	
	///Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
	public let heading: TelegramInteger?
	
	///Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
	public let proximityAlertRadius: TelegramInteger?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the location
	public let inputMessageContent: InputMessageContent?
	
	///Optional. Url of the thumbnail for the result
	public let thumbnailUrl: String?
	
	///Optional. Thumbnail width
	public let thumbnailWidth: TelegramInteger?
	
	///Optional. Thumbnail height
	public let thumbnailHeight: TelegramInteger?

	public init(
		type: String,
		id: String,
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		title: String,
		horizontalAccuracy: TelegramFloat? = nil,
		livePeriod: TelegramInteger? = nil,
		heading: TelegramInteger? = nil,
		proximityAlertRadius: TelegramInteger? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil,
		inputMessageContent: InputMessageContent? = nil,
		thumbnailUrl: String? = nil,
		thumbnailWidth: TelegramInteger? = nil,
		thumbnailHeight: TelegramInteger? = nil
	) {
		self.type = type
		self.id = id
		self.latitude = latitude
		self.longitude = longitude
		self.title = title
		self.horizontalAccuracy = horizontalAccuracy
		self.livePeriod = livePeriod
		self.heading = heading
		self.proximityAlertRadius = proximityAlertRadius
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbnailUrl = thumbnailUrl
		self.thumbnailWidth = thumbnailWidth
		self.thumbnailHeight = thumbnailHeight
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case latitude
		case longitude
		case title
		case horizontalAccuracy = "horizontal_accuracy"
		case livePeriod = "live_period"
		case heading
		case proximityAlertRadius = "proximity_alert_radius"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
		case thumbnailUrl = "thumbnail_url"
		case thumbnailWidth = "thumbnail_width"
		case thumbnailHeight = "thumbnail_height"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.latitude.self, forKey: .latitude)
		try container.encode(self.longitude.self, forKey: .longitude)
		try container.encode(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.horizontalAccuracy.self, forKey: .horizontalAccuracy)
		try container.encodeIfPresent(self.livePeriod.self, forKey: .livePeriod)
		try container.encodeIfPresent(self.heading.self, forKey: .heading)
		try container.encodeIfPresent(self.proximityAlertRadius.self, forKey: .proximityAlertRadius)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
		try container.encodeIfPresent(self.inputMessageContent.self, forKey: .inputMessageContent)
		try container.encodeIfPresent(self.thumbnailUrl.self, forKey: .thumbnailUrl)
		try container.encodeIfPresent(self.thumbnailWidth.self, forKey: .thumbnailWidth)
		try container.encodeIfPresent(self.thumbnailHeight.self, forKey: .thumbnailHeight)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.id = try container.decode(String.self, forKey: .id)
		self.latitude = try container.decode(TelegramFloat.self, forKey: .latitude)
		self.longitude = try container.decode(TelegramFloat.self, forKey: .longitude)
		self.title = try container.decode(String.self, forKey: .title)
		self.horizontalAccuracy = try container.decodeIfPresent(TelegramFloat.self, forKey: .horizontalAccuracy)
		self.livePeriod = try container.decodeIfPresent(TelegramInteger.self, forKey: .livePeriod)
		self.heading = try container.decodeIfPresent(TelegramInteger.self, forKey: .heading)
		self.proximityAlertRadius = try container.decodeIfPresent(TelegramInteger.self, forKey: .proximityAlertRadius)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
		self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		self.thumbnailWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailWidth)
		self.thumbnailHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailHeight)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("id", object: self.id)
		encoder.append("latitude", object: self.latitude)
		encoder.append("longitude", object: self.longitude)
		encoder.append("title", object: self.title)
		encoder.append("horizontal_accuracy", object: self.horizontalAccuracy)
		encoder.append("live_period", object: self.livePeriod)
		encoder.append("heading", object: self.heading)
		encoder.append("proximity_alert_radius", object: self.proximityAlertRadius)
		encoder.append("reply_markup", object: self.replyMarkup)
		encoder.append("input_message_content", object: self.inputMessageContent)
		encoder.append("thumbnail_url", object: self.thumbnailUrl)
		encoder.append("thumbnail_width", object: self.thumbnailWidth)
		encoder.append("thumbnail_height", object: self.thumbnailHeight)
	}
}
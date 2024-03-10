import Foundation
public final class InlineQueryResultVenue: Codable, IMultiPartFromDataValueEncodable {
	///Type of the result, must be venue
	public let type: String
	
	///Unique identifier for this result, 1-64 Bytes
	public let id: String
	
	///Latitude of the venue location in degrees
	public let latitude: TelegramFloat
	
	///Longitude of the venue location in degrees
	public let longitude: TelegramFloat
	
	///Title of the venue
	public let title: String
	
	///Address of the venue
	public let address: String
	
	///Optional. Foursquare identifier of the venue if known
	public let foursquareId: String?
	
	///Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
	public let foursquareType: String?
	
	///Optional. Google Places identifier of the venue
	public let googlePlaceId: String?
	
	///Optional. Google Places type of the venue. (See supported types.)
	public let googlePlaceType: String?
	
	///Optional. Inline keyboard attached to the message
	public let replyMarkup: InlineKeyboardMarkup?
	
	///Optional. Content of the message to be sent instead of the venue
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
		address: String,
		foursquareId: String? = nil,
		foursquareType: String? = nil,
		googlePlaceId: String? = nil,
		googlePlaceType: String? = nil,
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
		self.address = address
		self.foursquareId = foursquareId
		self.foursquareType = foursquareType
		self.googlePlaceId = googlePlaceId
		self.googlePlaceType = googlePlaceType
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
		case address
		case foursquareId = "foursquare_id"
		case foursquareType = "foursquare_type"
		case googlePlaceId = "google_place_id"
		case googlePlaceType = "google_place_type"
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
		try container.encode(self.address.self, forKey: .address)
		try container.encodeIfPresent(self.foursquareId.self, forKey: .foursquareId)
		try container.encodeIfPresent(self.foursquareType.self, forKey: .foursquareType)
		try container.encodeIfPresent(self.googlePlaceId.self, forKey: .googlePlaceId)
		try container.encodeIfPresent(self.googlePlaceType.self, forKey: .googlePlaceType)
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
		self.address = try container.decode(String.self, forKey: .address)
		self.foursquareId = try container.decodeIfPresent(String.self, forKey: .foursquareId)
		self.foursquareType = try container.decodeIfPresent(String.self, forKey: .foursquareType)
		self.googlePlaceId = try container.decodeIfPresent(String.self, forKey: .googlePlaceId)
		self.googlePlaceType = try container.decodeIfPresent(String.self, forKey: .googlePlaceType)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
		self.inputMessageContent = try container.decodeIfPresent(InputMessageContent.self, forKey: .inputMessageContent)
		self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		self.thumbnailWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailWidth)
		self.thumbnailHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .thumbnailHeight)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
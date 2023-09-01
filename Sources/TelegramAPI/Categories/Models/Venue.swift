import Foundation
public final class Venue: Codable, IMultiPartFromDataValueEncodable {
	///Venue location. Can't be a live location
	public let location: Location
	
	///Name of the venue
	public let title: String
	
	///Address of the venue
	public let address: String
	
	///Optional. Foursquare identifier of the venue
	public let foursquareId: String?
	
	///Optional. Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
	public let foursquareType: String?
	
	///Optional. Google Places identifier of the venue
	public let googlePlaceId: String?
	
	///Optional. Google Places type of the venue. (See supported types.)
	public let googlePlaceType: String?

	public init(
		location: Location,
		title: String,
		address: String,
		foursquareId: String? = nil,
		foursquareType: String? = nil,
		googlePlaceId: String? = nil,
		googlePlaceType: String? = nil
	) {
		self.location = location
		self.title = title
		self.address = address
		self.foursquareId = foursquareId
		self.foursquareType = foursquareType
		self.googlePlaceId = googlePlaceId
		self.googlePlaceType = googlePlaceType
	}

	private enum CodingKeys: String, CodingKey {
		case location
		case title
		case address
		case foursquareId = "foursquare_id"
		case foursquareType = "foursquare_type"
		case googlePlaceId = "google_place_id"
		case googlePlaceType = "google_place_type"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.location.self, forKey: .location)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.address.self, forKey: .address)
		try container.encodeIfPresent(self.foursquareId.self, forKey: .foursquareId)
		try container.encodeIfPresent(self.foursquareType.self, forKey: .foursquareType)
		try container.encodeIfPresent(self.googlePlaceId.self, forKey: .googlePlaceId)
		try container.encodeIfPresent(self.googlePlaceType.self, forKey: .googlePlaceType)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.location = try container.decode(Location.self, forKey: .location)
		self.title = try container.decode(String.self, forKey: .title)
		self.address = try container.decode(String.self, forKey: .address)
		self.foursquareId = try container.decodeIfPresent(String.self, forKey: .foursquareId)
		self.foursquareType = try container.decodeIfPresent(String.self, forKey: .foursquareType)
		self.googlePlaceId = try container.decodeIfPresent(String.self, forKey: .googlePlaceId)
		self.googlePlaceType = try container.decodeIfPresent(String.self, forKey: .googlePlaceType)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
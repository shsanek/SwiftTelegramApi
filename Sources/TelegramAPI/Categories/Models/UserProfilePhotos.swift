public final class UserProfilePhotos: Codable, IMultiPartFromDataEncodable {
	///Total number of profile pictures the target user has
	public let totalCount: TelegramInteger
	
	///Requested profile pictures (in up to 4 sizes each)
	public let photos: [[PhotoSize]]

	public init(
		totalCount: TelegramInteger,
		photos: [[PhotoSize]]
	) {
		self.totalCount = totalCount
		self.photos = photos
	}

	private enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case photos
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.totalCount.self, forKey: .totalCount)
		try container.encode(self.photos.self, forKey: .photos)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.totalCount = try container.decode(TelegramInteger.self, forKey: .totalCount)
		self.photos = try container.decode([[PhotoSize]].self, forKey: .photos)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("total_count", object: self.totalCount)
		encoder.append("photos", object: self.photos)
	}
}
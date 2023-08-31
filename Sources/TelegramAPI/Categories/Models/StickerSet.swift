public final class StickerSet: Codable, IMultiPartFromDataEncodable {
	///Sticker set name
	public let name: String
	
	///Sticker set title
	public let title: String
	
	///Type of stickers in the set, currently one of “regular”, “mask”, “custom_emoji”
	public let stickerType: String
	
	///True, if the sticker set contains animated stickers
	public let isAnimated: Bool
	
	///True, if the sticker set contains video stickers
	public let isVideo: Bool
	
	///List of all set stickers
	public let stickers: [Sticker]
	
	///Optional. Sticker set thumbnail in the .WEBP, .TGS, or .WEBM format
	public let thumbnail: PhotoSize?

	public init(
		name: String,
		title: String,
		stickerType: String,
		isAnimated: Bool,
		isVideo: Bool,
		stickers: [Sticker],
		thumbnail: PhotoSize? = nil
	) {
		self.name = name
		self.title = title
		self.stickerType = stickerType
		self.isAnimated = isAnimated
		self.isVideo = isVideo
		self.stickers = stickers
		self.thumbnail = thumbnail
	}

	private enum CodingKeys: String, CodingKey {
		case name
		case title
		case stickerType = "sticker_type"
		case isAnimated = "is_animated"
		case isVideo = "is_video"
		case stickers
		case thumbnail
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.name.self, forKey: .name)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.stickerType.self, forKey: .stickerType)
		try container.encode(self.isAnimated.self, forKey: .isAnimated)
		try container.encode(self.isVideo.self, forKey: .isVideo)
		try container.encode(self.stickers.self, forKey: .stickers)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.name = try container.decode(String.self, forKey: .name)
		self.title = try container.decode(String.self, forKey: .title)
		self.stickerType = try container.decode(String.self, forKey: .stickerType)
		self.isAnimated = try container.decode(Bool.self, forKey: .isAnimated)
		self.isVideo = try container.decode(Bool.self, forKey: .isVideo)
		self.stickers = try container.decode([Sticker].self, forKey: .stickers)
		self.thumbnail = try container.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("name", object: self.name)
		encoder.append("title", object: self.title)
		encoder.append("sticker_type", object: self.stickerType)
		encoder.append("is_animated", object: self.isAnimated)
		encoder.append("is_video", object: self.isVideo)
		encoder.append("stickers", object: self.stickers)
		encoder.append("thumbnail", object: self.thumbnail)
	}
}
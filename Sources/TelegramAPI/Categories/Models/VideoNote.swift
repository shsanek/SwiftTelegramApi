public final class VideoNote: Codable, IMultiPartFromDataEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Video width and height (diameter of the video message) as defined by sender
	public let length: TelegramInteger
	
	///Duration of the video in seconds as defined by sender
	public let duration: TelegramInteger
	
	///Optional. Video thumbnail
	public let thumbnail: PhotoSize?
	
	///Optional. File size in bytes
	public let fileSize: TelegramInteger?

	public init(
		fileId: String,
		fileUniqueId: String,
		length: TelegramInteger,
		duration: TelegramInteger,
		thumbnail: PhotoSize? = nil,
		fileSize: TelegramInteger? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.length = length
		self.duration = duration
		self.thumbnail = thumbnail
		self.fileSize = fileSize
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case length
		case duration
		case thumbnail
		case fileSize = "file_size"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.length.self, forKey: .length)
		try container.encode(self.duration.self, forKey: .duration)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.length = try container.decode(TelegramInteger.self, forKey: .length)
		self.duration = try container.decode(TelegramInteger.self, forKey: .duration)
		self.thumbnail = try container.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("file_id", object: self.fileId)
		encoder.append("file_unique_id", object: self.fileUniqueId)
		encoder.append("length", object: self.length)
		encoder.append("duration", object: self.duration)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("file_size", object: self.fileSize)
	}
}
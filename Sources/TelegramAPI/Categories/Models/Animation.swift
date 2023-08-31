public final class Animation: Codable, IMultiPartFromDataEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Video width as defined by sender
	public let width: TelegramInteger
	
	///Video height as defined by sender
	public let height: TelegramInteger
	
	///Duration of the video in seconds as defined by sender
	public let duration: TelegramInteger
	
	///Optional. Animation thumbnail as defined by sender
	public let thumbnail: PhotoSize?
	
	///Optional. Original animation filename as defined by sender
	public let fileName: String?
	
	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?
	
	///Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
	public let fileSize: TelegramInteger?

	public init(
		fileId: String,
		fileUniqueId: String,
		width: TelegramInteger,
		height: TelegramInteger,
		duration: TelegramInteger,
		thumbnail: PhotoSize? = nil,
		fileName: String? = nil,
		mimeType: String? = nil,
		fileSize: TelegramInteger? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.width = width
		self.height = height
		self.duration = duration
		self.thumbnail = thumbnail
		self.fileName = fileName
		self.mimeType = mimeType
		self.fileSize = fileSize
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case width
		case height
		case duration
		case thumbnail
		case fileName = "file_name"
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.width.self, forKey: .width)
		try container.encode(self.height.self, forKey: .height)
		try container.encode(self.duration.self, forKey: .duration)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
		try container.encodeIfPresent(self.fileName.self, forKey: .fileName)
		try container.encodeIfPresent(self.mimeType.self, forKey: .mimeType)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.width = try container.decode(TelegramInteger.self, forKey: .width)
		self.height = try container.decode(TelegramInteger.self, forKey: .height)
		self.duration = try container.decode(TelegramInteger.self, forKey: .duration)
		self.thumbnail = try container.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
		self.fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
		self.mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("file_id", object: self.fileId)
		encoder.append("file_unique_id", object: self.fileUniqueId)
		encoder.append("width", object: self.width)
		encoder.append("height", object: self.height)
		encoder.append("duration", object: self.duration)
		encoder.append("thumbnail", object: self.thumbnail)
		encoder.append("file_name", object: self.fileName)
		encoder.append("mime_type", object: self.mimeType)
		encoder.append("file_size", object: self.fileSize)
	}
}
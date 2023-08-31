public final class PhotoSize: Codable, IMultiPartFromDataEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Photo width
	public let width: TelegramInteger
	
	///Photo height
	public let height: TelegramInteger
	
	///Optional. File size in bytes
	public let fileSize: TelegramInteger?

	public init(
		fileId: String,
		fileUniqueId: String,
		width: TelegramInteger,
		height: TelegramInteger,
		fileSize: TelegramInteger? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.width = width
		self.height = height
		self.fileSize = fileSize
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case width
		case height
		case fileSize = "file_size"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.width.self, forKey: .width)
		try container.encode(self.height.self, forKey: .height)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.width = try container.decode(TelegramInteger.self, forKey: .width)
		self.height = try container.decode(TelegramInteger.self, forKey: .height)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("file_id", object: self.fileId)
		encoder.append("file_unique_id", object: self.fileUniqueId)
		encoder.append("width", object: self.width)
		encoder.append("height", object: self.height)
		encoder.append("file_size", object: self.fileSize)
	}
}
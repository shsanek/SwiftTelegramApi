public final class Voice: Codable, IMultiPartFromDataEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Duration of the audio in seconds as defined by sender
	public let duration: TelegramInteger
	
	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?
	
	///Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
	public let fileSize: TelegramInteger?

	public init(
		fileId: String,
		fileUniqueId: String,
		duration: TelegramInteger,
		mimeType: String? = nil,
		fileSize: TelegramInteger? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.duration = duration
		self.mimeType = mimeType
		self.fileSize = fileSize
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case duration
		case mimeType = "mime_type"
		case fileSize = "file_size"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.duration.self, forKey: .duration)
		try container.encodeIfPresent(self.mimeType.self, forKey: .mimeType)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.duration = try container.decode(TelegramInteger.self, forKey: .duration)
		self.mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("file_id", object: self.fileId)
		encoder.append("file_unique_id", object: self.fileUniqueId)
		encoder.append("duration", object: self.duration)
		encoder.append("mime_type", object: self.mimeType)
		encoder.append("file_size", object: self.fileSize)
	}
}
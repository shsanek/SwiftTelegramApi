import Foundation
public final class Audio: Codable, IMultiPartFromDataValueEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Duration of the audio in seconds as defined by sender
	public let duration: TelegramInteger
	
	///Optional. Performer of the audio as defined by sender or by audio tags
	public let performer: String?
	
	///Optional. Title of the audio as defined by sender or by audio tags
	public let title: String?
	
	///Optional. Original filename as defined by sender
	public let fileName: String?
	
	///Optional. MIME type of the file as defined by sender
	public let mimeType: String?
	
	///Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
	public let fileSize: TelegramInteger?
	
	///Optional. Thumbnail of the album cover to which the music file belongs
	public let thumbnail: PhotoSize?

	public init(
		fileId: String,
		fileUniqueId: String,
		duration: TelegramInteger,
		performer: String? = nil,
		title: String? = nil,
		fileName: String? = nil,
		mimeType: String? = nil,
		fileSize: TelegramInteger? = nil,
		thumbnail: PhotoSize? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.duration = duration
		self.performer = performer
		self.title = title
		self.fileName = fileName
		self.mimeType = mimeType
		self.fileSize = fileSize
		self.thumbnail = thumbnail
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case duration
		case performer
		case title
		case fileName = "file_name"
		case mimeType = "mime_type"
		case fileSize = "file_size"
		case thumbnail
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.duration.self, forKey: .duration)
		try container.encodeIfPresent(self.performer.self, forKey: .performer)
		try container.encodeIfPresent(self.title.self, forKey: .title)
		try container.encodeIfPresent(self.fileName.self, forKey: .fileName)
		try container.encodeIfPresent(self.mimeType.self, forKey: .mimeType)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
		try container.encodeIfPresent(self.thumbnail.self, forKey: .thumbnail)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.duration = try container.decode(TelegramInteger.self, forKey: .duration)
		self.performer = try container.decodeIfPresent(String.self, forKey: .performer)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
		self.mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
		self.thumbnail = try container.decodeIfPresent(PhotoSize.self, forKey: .thumbnail)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
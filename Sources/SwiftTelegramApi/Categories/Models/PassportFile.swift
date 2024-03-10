import Foundation
public final class PassportFile: Codable, IMultiPartFromDataValueEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///File size in bytes
	public let fileSize: TelegramInteger
	
	///Unix time when the file was uploaded
	public let fileDate: TelegramInteger

	public init(
		fileId: String,
		fileUniqueId: String,
		fileSize: TelegramInteger,
		fileDate: TelegramInteger
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.fileSize = fileSize
		self.fileDate = fileDate
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case fileSize = "file_size"
		case fileDate = "file_date"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encode(self.fileSize.self, forKey: .fileSize)
		try container.encode(self.fileDate.self, forKey: .fileDate)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.fileSize = try container.decode(TelegramInteger.self, forKey: .fileSize)
		self.fileDate = try container.decode(TelegramInteger.self, forKey: .fileDate)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
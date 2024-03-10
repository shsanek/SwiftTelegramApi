import Foundation
public final class File: Codable, IMultiPartFromDataValueEncodable {
	///Identifier for this file, which can be used to download or reuse the file
	public let fileId: String
	
	///Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let fileUniqueId: String
	
	///Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
	public let fileSize: TelegramInteger?
	
	///Optional. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
	public let filePath: String?

	public init(
		fileId: String,
		fileUniqueId: String,
		fileSize: TelegramInteger? = nil,
		filePath: String? = nil
	) {
		self.fileId = fileId
		self.fileUniqueId = fileUniqueId
		self.fileSize = fileSize
		self.filePath = filePath
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
		case fileUniqueId = "file_unique_id"
		case fileSize = "file_size"
		case filePath = "file_path"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
		try container.encode(self.fileUniqueId.self, forKey: .fileUniqueId)
		try container.encodeIfPresent(self.fileSize.self, forKey: .fileSize)
		try container.encodeIfPresent(self.filePath.self, forKey: .filePath)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
		self.fileUniqueId = try container.decode(String.self, forKey: .fileUniqueId)
		self.fileSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .fileSize)
		self.filePath = try container.decodeIfPresent(String.self, forKey: .filePath)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class ChatPhoto: Codable, IMultiPartFromDataValueEncodable {
	///File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
	public let smallFileId: String
	
	///Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let smallFileUniqueId: String
	
	///File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
	public let bigFileId: String
	
	///Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
	public let bigFileUniqueId: String

	public init(
		smallFileId: String,
		smallFileUniqueId: String,
		bigFileId: String,
		bigFileUniqueId: String
	) {
		self.smallFileId = smallFileId
		self.smallFileUniqueId = smallFileUniqueId
		self.bigFileId = bigFileId
		self.bigFileUniqueId = bigFileUniqueId
	}

	private enum CodingKeys: String, CodingKey {
		case smallFileId = "small_file_id"
		case smallFileUniqueId = "small_file_unique_id"
		case bigFileId = "big_file_id"
		case bigFileUniqueId = "big_file_unique_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.smallFileId.self, forKey: .smallFileId)
		try container.encode(self.smallFileUniqueId.self, forKey: .smallFileUniqueId)
		try container.encode(self.bigFileId.self, forKey: .bigFileId)
		try container.encode(self.bigFileUniqueId.self, forKey: .bigFileUniqueId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.smallFileId = try container.decode(String.self, forKey: .smallFileId)
		self.smallFileUniqueId = try container.decode(String.self, forKey: .smallFileUniqueId)
		self.bigFileId = try container.decode(String.self, forKey: .bigFileId)
		self.bigFileUniqueId = try container.decode(String.self, forKey: .bigFileUniqueId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
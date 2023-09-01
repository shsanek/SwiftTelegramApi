import Foundation
public final class VideoChatEnded: Codable, IMultiPartFromDataValueEncodable {
	///Video chat duration in seconds
	public let duration: TelegramInteger

	public init(
		duration: TelegramInteger
	) {
		self.duration = duration
	}

	private enum CodingKeys: String, CodingKey {
		case duration
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.duration.self, forKey: .duration)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.duration = try container.decode(TelegramInteger.self, forKey: .duration)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
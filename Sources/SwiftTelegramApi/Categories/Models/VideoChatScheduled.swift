import Foundation
public final class VideoChatScheduled: Codable, IMultiPartFromDataValueEncodable {
	///Point in time (Unix timestamp) when the video chat is supposed to be started by a chat administrator
	public let startDate: TelegramInteger

	public init(
		startDate: TelegramInteger
	) {
		self.startDate = startDate
	}

	private enum CodingKeys: String, CodingKey {
		case startDate = "start_date"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.startDate.self, forKey: .startDate)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.startDate = try container.decode(TelegramInteger.self, forKey: .startDate)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
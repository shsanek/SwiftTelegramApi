import Foundation
public final class MessageId: Codable, IMultiPartFromDataValueEncodable {
	///Unique message identifier
	public let messageId: TelegramInteger

	public init(
		messageId: TelegramInteger
	) {
		self.messageId = messageId
	}

	private enum CodingKeys: String, CodingKey {
		case messageId = "message_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.messageId.self, forKey: .messageId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.messageId = try container.decode(TelegramInteger.self, forKey: .messageId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
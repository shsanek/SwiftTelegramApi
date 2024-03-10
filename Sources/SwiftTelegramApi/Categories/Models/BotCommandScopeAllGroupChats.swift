import Foundation
public final class BotCommandScopeAllGroupChats: Codable, IMultiPartFromDataValueEncodable {
	///Scope type, must be all_group_chats
	public let type: String

	public init(
		type: String
	) {
		self.type = type
	}

	private enum CodingKeys: String, CodingKey {
		case type
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation
public final class ChosenInlineResult: Codable, IMultiPartFromDataValueEncodable {
	///The unique identifier for the result that was chosen
	public let resultId: String
	
	///The user that chose the result
	public let from: User
	
	///Optional. Sender location, only for bots that require user location
	public let location: Location?
	
	///Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
	public let inlineMessageId: String?
	
	///The query that was used to obtain the result
	public let query: String

	public init(
		resultId: String,
		from: User,
		location: Location? = nil,
		inlineMessageId: String? = nil,
		query: String
	) {
		self.resultId = resultId
		self.from = from
		self.location = location
		self.inlineMessageId = inlineMessageId
		self.query = query
	}

	private enum CodingKeys: String, CodingKey {
		case resultId = "result_id"
		case from
		case location
		case inlineMessageId = "inline_message_id"
		case query
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.resultId.self, forKey: .resultId)
		try container.encode(self.from.self, forKey: .from)
		try container.encodeIfPresent(self.location.self, forKey: .location)
		try container.encodeIfPresent(self.inlineMessageId.self, forKey: .inlineMessageId)
		try container.encode(self.query.self, forKey: .query)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.resultId = try container.decode(String.self, forKey: .resultId)
		self.from = try container.decode(User.self, forKey: .from)
		self.location = try container.decodeIfPresent(Location.self, forKey: .location)
		self.inlineMessageId = try container.decodeIfPresent(String.self, forKey: .inlineMessageId)
		self.query = try container.decode(String.self, forKey: .query)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
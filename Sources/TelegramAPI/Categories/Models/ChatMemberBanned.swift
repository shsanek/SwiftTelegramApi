import Foundation
public final class ChatMemberBanned: Codable, IMultiPartFromDataValueEncodable {
	///The member's status in the chat, always “kicked”
	public let status: String
	
	///Information about the user
	public let user: User
	
	///Date when restrictions will be lifted for this user; Unix time. If 0, then the user is banned forever
	public let untilDate: TelegramInteger

	public init(
		status: String,
		user: User,
		untilDate: TelegramInteger
	) {
		self.status = status
		self.user = user
		self.untilDate = untilDate
	}

	private enum CodingKeys: String, CodingKey {
		case status
		case user
		case untilDate = "until_date"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.status.self, forKey: .status)
		try container.encode(self.user.self, forKey: .user)
		try container.encode(self.untilDate.self, forKey: .untilDate)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.status = try container.decode(String.self, forKey: .status)
		self.user = try container.decode(User.self, forKey: .user)
		self.untilDate = try container.decode(TelegramInteger.self, forKey: .untilDate)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
public final class ChatMemberMember: Codable, IMultiPartFromDataEncodable {
	///The member's status in the chat, always “member”
	public let status: String
	
	///Information about the user
	public let user: User

	public init(
		status: String,
		user: User
	) {
		self.status = status
		self.user = user
	}

	private enum CodingKeys: String, CodingKey {
		case status
		case user
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.status.self, forKey: .status)
		try container.encode(self.user.self, forKey: .user)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.status = try container.decode(String.self, forKey: .status)
		self.user = try container.decode(User.self, forKey: .user)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("status", object: self.status)
		encoder.append("user", object: self.user)
	}
}
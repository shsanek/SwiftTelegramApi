public final class VideoChatParticipantsInvited: Codable, IMultiPartFromDataEncodable {
	///New members that were invited to the video chat
	public let users: [User]

	public init(
		users: [User]
	) {
		self.users = users
	}

	private enum CodingKeys: String, CodingKey {
		case users
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.users.self, forKey: .users)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.users = try container.decode([User].self, forKey: .users)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("users", object: self.users)
	}
}
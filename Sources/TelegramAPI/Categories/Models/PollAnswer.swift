public final class PollAnswer: Codable, IMultiPartFromDataEncodable {
	///Unique poll identifier
	public let pollId: String
	
	///Optional. The chat that changed the answer to the poll, if the voter is anonymous
	public let voterChat: Chat?
	
	///Optional. The user that changed the answer to the poll, if the voter isn't anonymous
	public let user: User?
	
	///0-based identifiers of chosen answer options. May be empty if the vote was retracted.
	public let optionIds: [TelegramInteger]

	public init(
		pollId: String,
		voterChat: Chat? = nil,
		user: User? = nil,
		optionIds: [TelegramInteger]
	) {
		self.pollId = pollId
		self.voterChat = voterChat
		self.user = user
		self.optionIds = optionIds
	}

	private enum CodingKeys: String, CodingKey {
		case pollId = "poll_id"
		case voterChat = "voter_chat"
		case user
		case optionIds = "option_ids"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.pollId.self, forKey: .pollId)
		try container.encodeIfPresent(self.voterChat.self, forKey: .voterChat)
		try container.encodeIfPresent(self.user.self, forKey: .user)
		try container.encode(self.optionIds.self, forKey: .optionIds)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.pollId = try container.decode(String.self, forKey: .pollId)
		self.voterChat = try container.decodeIfPresent(Chat.self, forKey: .voterChat)
		self.user = try container.decodeIfPresent(User.self, forKey: .user)
		self.optionIds = try container.decode([TelegramInteger].self, forKey: .optionIds)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("poll_id", object: self.pollId)
		encoder.append("voter_chat", object: self.voterChat)
		encoder.append("user", object: self.user)
		encoder.append("option_ids", object: self.optionIds)
	}
}
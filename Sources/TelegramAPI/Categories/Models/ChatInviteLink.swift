public final class ChatInviteLink: Codable, IMultiPartFromDataEncodable {
	///The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with “…”.
	public let inviteLink: String
	
	///Creator of the link
	public let creator: User
	
	///True, if users joining the chat via the link need to be approved by chat administrators
	public let createsJoinRequest: Bool
	
	///True, if the link is primary
	public let isPrimary: Bool
	
	///True, if the link is revoked
	public let isRevoked: Bool
	
	///Optional. Invite link name
	public let name: String?
	
	///Optional. Point in time (Unix timestamp) when the link will expire or has been expired
	public let expireDate: TelegramInteger?
	
	///Optional. The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
	public let memberLimit: TelegramInteger?
	
	///Optional. Number of pending join requests created using this link
	public let pendingJoinRequestCount: TelegramInteger?

	public init(
		inviteLink: String,
		creator: User,
		createsJoinRequest: Bool,
		isPrimary: Bool,
		isRevoked: Bool,
		name: String? = nil,
		expireDate: TelegramInteger? = nil,
		memberLimit: TelegramInteger? = nil,
		pendingJoinRequestCount: TelegramInteger? = nil
	) {
		self.inviteLink = inviteLink
		self.creator = creator
		self.createsJoinRequest = createsJoinRequest
		self.isPrimary = isPrimary
		self.isRevoked = isRevoked
		self.name = name
		self.expireDate = expireDate
		self.memberLimit = memberLimit
		self.pendingJoinRequestCount = pendingJoinRequestCount
	}

	private enum CodingKeys: String, CodingKey {
		case inviteLink = "invite_link"
		case creator
		case createsJoinRequest = "creates_join_request"
		case isPrimary = "is_primary"
		case isRevoked = "is_revoked"
		case name
		case expireDate = "expire_date"
		case memberLimit = "member_limit"
		case pendingJoinRequestCount = "pending_join_request_count"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.inviteLink.self, forKey: .inviteLink)
		try container.encode(self.creator.self, forKey: .creator)
		try container.encode(self.createsJoinRequest.self, forKey: .createsJoinRequest)
		try container.encode(self.isPrimary.self, forKey: .isPrimary)
		try container.encode(self.isRevoked.self, forKey: .isRevoked)
		try container.encodeIfPresent(self.name.self, forKey: .name)
		try container.encodeIfPresent(self.expireDate.self, forKey: .expireDate)
		try container.encodeIfPresent(self.memberLimit.self, forKey: .memberLimit)
		try container.encodeIfPresent(self.pendingJoinRequestCount.self, forKey: .pendingJoinRequestCount)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.inviteLink = try container.decode(String.self, forKey: .inviteLink)
		self.creator = try container.decode(User.self, forKey: .creator)
		self.createsJoinRequest = try container.decode(Bool.self, forKey: .createsJoinRequest)
		self.isPrimary = try container.decode(Bool.self, forKey: .isPrimary)
		self.isRevoked = try container.decode(Bool.self, forKey: .isRevoked)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.expireDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .expireDate)
		self.memberLimit = try container.decodeIfPresent(TelegramInteger.self, forKey: .memberLimit)
		self.pendingJoinRequestCount = try container.decodeIfPresent(TelegramInteger.self, forKey: .pendingJoinRequestCount)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("invite_link", object: self.inviteLink)
		encoder.append("creator", object: self.creator)
		encoder.append("creates_join_request", object: self.createsJoinRequest)
		encoder.append("is_primary", object: self.isPrimary)
		encoder.append("is_revoked", object: self.isRevoked)
		encoder.append("name", object: self.name)
		encoder.append("expire_date", object: self.expireDate)
		encoder.append("member_limit", object: self.memberLimit)
		encoder.append("pending_join_request_count", object: self.pendingJoinRequestCount)
	}
}
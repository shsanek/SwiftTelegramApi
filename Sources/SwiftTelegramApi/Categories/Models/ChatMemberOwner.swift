import Foundation
public final class ChatMemberOwner: Codable, IMultiPartFromDataValueEncodable {
	///The member's status in the chat, always “creator”
	public let status: String
	
	///Information about the user
	public let user: User
	
	///True, if the user's presence in the chat is hidden
	public let isAnonymous: Bool
	
	///Optional. Custom title for this user
	public let customTitle: String?

	public init(
		status: String,
		user: User,
		isAnonymous: Bool,
		customTitle: String? = nil
	) {
		self.status = status
		self.user = user
		self.isAnonymous = isAnonymous
		self.customTitle = customTitle
	}

	private enum CodingKeys: String, CodingKey {
		case status
		case user
		case isAnonymous = "is_anonymous"
		case customTitle = "custom_title"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.status.self, forKey: .status)
		try container.encode(self.user.self, forKey: .user)
		try container.encode(self.isAnonymous.self, forKey: .isAnonymous)
		try container.encodeIfPresent(self.customTitle.self, forKey: .customTitle)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.status = try container.decode(String.self, forKey: .status)
		self.user = try container.decode(User.self, forKey: .user)
		self.isAnonymous = try container.decode(Bool.self, forKey: .isAnonymous)
		self.customTitle = try container.decodeIfPresent(String.self, forKey: .customTitle)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
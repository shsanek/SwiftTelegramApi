import Foundation
public final class ChatMemberRestricted: Codable, IMultiPartFromDataValueEncodable {
	///The member's status in the chat, always “restricted”
	public let status: String
	
	///Information about the user
	public let user: User
	
	///True, if the user is a member of the chat at the moment of the request
	public let isMember: Bool
	
	///True, if the user is allowed to send text messages, contacts, invoices, locations and venues
	public let canSendMessages: Bool
	
	///True, if the user is allowed to send audios
	public let canSendAudios: Bool
	
	///True, if the user is allowed to send documents
	public let canSendDocuments: Bool
	
	///True, if the user is allowed to send photos
	public let canSendPhotos: Bool
	
	///True, if the user is allowed to send videos
	public let canSendVideos: Bool
	
	///True, if the user is allowed to send video notes
	public let canSendVideoNotes: Bool
	
	///True, if the user is allowed to send voice notes
	public let canSendVoiceNotes: Bool
	
	///True, if the user is allowed to send polls
	public let canSendPolls: Bool
	
	///True, if the user is allowed to send animations, games, stickers and use inline bots
	public let canSendOtherMessages: Bool
	
	///True, if the user is allowed to add web page previews to their messages
	public let canAddWebPagePreviews: Bool
	
	///True, if the user is allowed to change the chat title, photo and other settings
	public let canChangeInfo: Bool
	
	///True, if the user is allowed to invite new users to the chat
	public let canInviteUsers: Bool
	
	///True, if the user is allowed to pin messages
	public let canPinMessages: Bool
	
	///True, if the user is allowed to create forum topics
	public let canManageTopics: Bool
	
	///Date when restrictions will be lifted for this user; Unix time. If 0, then the user is restricted forever
	public let untilDate: TelegramInteger

	public init(
		status: String,
		user: User,
		isMember: Bool,
		canSendMessages: Bool,
		canSendAudios: Bool,
		canSendDocuments: Bool,
		canSendPhotos: Bool,
		canSendVideos: Bool,
		canSendVideoNotes: Bool,
		canSendVoiceNotes: Bool,
		canSendPolls: Bool,
		canSendOtherMessages: Bool,
		canAddWebPagePreviews: Bool,
		canChangeInfo: Bool,
		canInviteUsers: Bool,
		canPinMessages: Bool,
		canManageTopics: Bool,
		untilDate: TelegramInteger
	) {
		self.status = status
		self.user = user
		self.isMember = isMember
		self.canSendMessages = canSendMessages
		self.canSendAudios = canSendAudios
		self.canSendDocuments = canSendDocuments
		self.canSendPhotos = canSendPhotos
		self.canSendVideos = canSendVideos
		self.canSendVideoNotes = canSendVideoNotes
		self.canSendVoiceNotes = canSendVoiceNotes
		self.canSendPolls = canSendPolls
		self.canSendOtherMessages = canSendOtherMessages
		self.canAddWebPagePreviews = canAddWebPagePreviews
		self.canChangeInfo = canChangeInfo
		self.canInviteUsers = canInviteUsers
		self.canPinMessages = canPinMessages
		self.canManageTopics = canManageTopics
		self.untilDate = untilDate
	}

	private enum CodingKeys: String, CodingKey {
		case status
		case user
		case isMember = "is_member"
		case canSendMessages = "can_send_messages"
		case canSendAudios = "can_send_audios"
		case canSendDocuments = "can_send_documents"
		case canSendPhotos = "can_send_photos"
		case canSendVideos = "can_send_videos"
		case canSendVideoNotes = "can_send_video_notes"
		case canSendVoiceNotes = "can_send_voice_notes"
		case canSendPolls = "can_send_polls"
		case canSendOtherMessages = "can_send_other_messages"
		case canAddWebPagePreviews = "can_add_web_page_previews"
		case canChangeInfo = "can_change_info"
		case canInviteUsers = "can_invite_users"
		case canPinMessages = "can_pin_messages"
		case canManageTopics = "can_manage_topics"
		case untilDate = "until_date"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.status.self, forKey: .status)
		try container.encode(self.user.self, forKey: .user)
		try container.encode(self.isMember.self, forKey: .isMember)
		try container.encode(self.canSendMessages.self, forKey: .canSendMessages)
		try container.encode(self.canSendAudios.self, forKey: .canSendAudios)
		try container.encode(self.canSendDocuments.self, forKey: .canSendDocuments)
		try container.encode(self.canSendPhotos.self, forKey: .canSendPhotos)
		try container.encode(self.canSendVideos.self, forKey: .canSendVideos)
		try container.encode(self.canSendVideoNotes.self, forKey: .canSendVideoNotes)
		try container.encode(self.canSendVoiceNotes.self, forKey: .canSendVoiceNotes)
		try container.encode(self.canSendPolls.self, forKey: .canSendPolls)
		try container.encode(self.canSendOtherMessages.self, forKey: .canSendOtherMessages)
		try container.encode(self.canAddWebPagePreviews.self, forKey: .canAddWebPagePreviews)
		try container.encode(self.canChangeInfo.self, forKey: .canChangeInfo)
		try container.encode(self.canInviteUsers.self, forKey: .canInviteUsers)
		try container.encode(self.canPinMessages.self, forKey: .canPinMessages)
		try container.encode(self.canManageTopics.self, forKey: .canManageTopics)
		try container.encode(self.untilDate.self, forKey: .untilDate)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.status = try container.decode(String.self, forKey: .status)
		self.user = try container.decode(User.self, forKey: .user)
		self.isMember = try container.decode(Bool.self, forKey: .isMember)
		self.canSendMessages = try container.decode(Bool.self, forKey: .canSendMessages)
		self.canSendAudios = try container.decode(Bool.self, forKey: .canSendAudios)
		self.canSendDocuments = try container.decode(Bool.self, forKey: .canSendDocuments)
		self.canSendPhotos = try container.decode(Bool.self, forKey: .canSendPhotos)
		self.canSendVideos = try container.decode(Bool.self, forKey: .canSendVideos)
		self.canSendVideoNotes = try container.decode(Bool.self, forKey: .canSendVideoNotes)
		self.canSendVoiceNotes = try container.decode(Bool.self, forKey: .canSendVoiceNotes)
		self.canSendPolls = try container.decode(Bool.self, forKey: .canSendPolls)
		self.canSendOtherMessages = try container.decode(Bool.self, forKey: .canSendOtherMessages)
		self.canAddWebPagePreviews = try container.decode(Bool.self, forKey: .canAddWebPagePreviews)
		self.canChangeInfo = try container.decode(Bool.self, forKey: .canChangeInfo)
		self.canInviteUsers = try container.decode(Bool.self, forKey: .canInviteUsers)
		self.canPinMessages = try container.decode(Bool.self, forKey: .canPinMessages)
		self.canManageTopics = try container.decode(Bool.self, forKey: .canManageTopics)
		self.untilDate = try container.decode(TelegramInteger.self, forKey: .untilDate)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
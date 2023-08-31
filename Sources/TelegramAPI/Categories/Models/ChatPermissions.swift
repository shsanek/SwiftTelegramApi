public final class ChatPermissions: Codable, IMultiPartFromDataEncodable {
	///Optional. True, if the user is allowed to send text messages, contacts, invoices, locations and venues
	public let canSendMessages: Bool?
	
	///Optional. True, if the user is allowed to send audios
	public let canSendAudios: Bool?
	
	///Optional. True, if the user is allowed to send documents
	public let canSendDocuments: Bool?
	
	///Optional. True, if the user is allowed to send photos
	public let canSendPhotos: Bool?
	
	///Optional. True, if the user is allowed to send videos
	public let canSendVideos: Bool?
	
	///Optional. True, if the user is allowed to send video notes
	public let canSendVideoNotes: Bool?
	
	///Optional. True, if the user is allowed to send voice notes
	public let canSendVoiceNotes: Bool?
	
	///Optional. True, if the user is allowed to send polls
	public let canSendPolls: Bool?
	
	///Optional. True, if the user is allowed to send animations, games, stickers and use inline bots
	public let canSendOtherMessages: Bool?
	
	///Optional. True, if the user is allowed to add web page previews to their messages
	public let canAddWebPagePreviews: Bool?
	
	///Optional. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
	public let canChangeInfo: Bool?
	
	///Optional. True, if the user is allowed to invite new users to the chat
	public let canInviteUsers: Bool?
	
	///Optional. True, if the user is allowed to pin messages. Ignored in public supergroups
	public let canPinMessages: Bool?
	
	///Optional. True, if the user is allowed to create forum topics. If omitted defaults to the value of can_pin_messages
	public let canManageTopics: Bool?

	public init(
		canSendMessages: Bool? = nil,
		canSendAudios: Bool? = nil,
		canSendDocuments: Bool? = nil,
		canSendPhotos: Bool? = nil,
		canSendVideos: Bool? = nil,
		canSendVideoNotes: Bool? = nil,
		canSendVoiceNotes: Bool? = nil,
		canSendPolls: Bool? = nil,
		canSendOtherMessages: Bool? = nil,
		canAddWebPagePreviews: Bool? = nil,
		canChangeInfo: Bool? = nil,
		canInviteUsers: Bool? = nil,
		canPinMessages: Bool? = nil,
		canManageTopics: Bool? = nil
	) {
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
	}

	private enum CodingKeys: String, CodingKey {
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
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.canSendMessages.self, forKey: .canSendMessages)
		try container.encodeIfPresent(self.canSendAudios.self, forKey: .canSendAudios)
		try container.encodeIfPresent(self.canSendDocuments.self, forKey: .canSendDocuments)
		try container.encodeIfPresent(self.canSendPhotos.self, forKey: .canSendPhotos)
		try container.encodeIfPresent(self.canSendVideos.self, forKey: .canSendVideos)
		try container.encodeIfPresent(self.canSendVideoNotes.self, forKey: .canSendVideoNotes)
		try container.encodeIfPresent(self.canSendVoiceNotes.self, forKey: .canSendVoiceNotes)
		try container.encodeIfPresent(self.canSendPolls.self, forKey: .canSendPolls)
		try container.encodeIfPresent(self.canSendOtherMessages.self, forKey: .canSendOtherMessages)
		try container.encodeIfPresent(self.canAddWebPagePreviews.self, forKey: .canAddWebPagePreviews)
		try container.encodeIfPresent(self.canChangeInfo.self, forKey: .canChangeInfo)
		try container.encodeIfPresent(self.canInviteUsers.self, forKey: .canInviteUsers)
		try container.encodeIfPresent(self.canPinMessages.self, forKey: .canPinMessages)
		try container.encodeIfPresent(self.canManageTopics.self, forKey: .canManageTopics)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.canSendMessages = try container.decodeIfPresent(Bool.self, forKey: .canSendMessages)
		self.canSendAudios = try container.decodeIfPresent(Bool.self, forKey: .canSendAudios)
		self.canSendDocuments = try container.decodeIfPresent(Bool.self, forKey: .canSendDocuments)
		self.canSendPhotos = try container.decodeIfPresent(Bool.self, forKey: .canSendPhotos)
		self.canSendVideos = try container.decodeIfPresent(Bool.self, forKey: .canSendVideos)
		self.canSendVideoNotes = try container.decodeIfPresent(Bool.self, forKey: .canSendVideoNotes)
		self.canSendVoiceNotes = try container.decodeIfPresent(Bool.self, forKey: .canSendVoiceNotes)
		self.canSendPolls = try container.decodeIfPresent(Bool.self, forKey: .canSendPolls)
		self.canSendOtherMessages = try container.decodeIfPresent(Bool.self, forKey: .canSendOtherMessages)
		self.canAddWebPagePreviews = try container.decodeIfPresent(Bool.self, forKey: .canAddWebPagePreviews)
		self.canChangeInfo = try container.decodeIfPresent(Bool.self, forKey: .canChangeInfo)
		self.canInviteUsers = try container.decodeIfPresent(Bool.self, forKey: .canInviteUsers)
		self.canPinMessages = try container.decodeIfPresent(Bool.self, forKey: .canPinMessages)
		self.canManageTopics = try container.decodeIfPresent(Bool.self, forKey: .canManageTopics)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("can_send_messages", object: self.canSendMessages)
		encoder.append("can_send_audios", object: self.canSendAudios)
		encoder.append("can_send_documents", object: self.canSendDocuments)
		encoder.append("can_send_photos", object: self.canSendPhotos)
		encoder.append("can_send_videos", object: self.canSendVideos)
		encoder.append("can_send_video_notes", object: self.canSendVideoNotes)
		encoder.append("can_send_voice_notes", object: self.canSendVoiceNotes)
		encoder.append("can_send_polls", object: self.canSendPolls)
		encoder.append("can_send_other_messages", object: self.canSendOtherMessages)
		encoder.append("can_add_web_page_previews", object: self.canAddWebPagePreviews)
		encoder.append("can_change_info", object: self.canChangeInfo)
		encoder.append("can_invite_users", object: self.canInviteUsers)
		encoder.append("can_pin_messages", object: self.canPinMessages)
		encoder.append("can_manage_topics", object: self.canManageTopics)
	}
}
public final class Message: Codable, IMultiPartFromDataEncodable {
	///Unique message identifier inside this chat
	public let messageId: TelegramInteger
	
	///Optional. Unique identifier of a message thread to which the message belongs; for supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Optional. Sender of the message; empty for messages sent to channels. For backward compatibility, the field contains a fake sender user in non-channel chats, if the message was sent on behalf of a chat.
	public let from: User?
	
	///Optional. Sender of the message, sent on behalf of a chat. For example, the channel itself for channel posts, the supergroup itself for messages from anonymous group administrators, the linked channel for messages automatically forwarded to the discussion group. For backward compatibility, the field from contains a fake sender user in non-channel chats, if the message was sent on behalf of a chat.
	public let senderChat: Chat?
	
	///Date the message was sent in Unix time
	public let date: TelegramInteger
	
	///Conversation the message belongs to
	public let chat: Chat
	
	///Optional. For forwarded messages, sender of the original message
	public let forwardFrom: User?
	
	///Optional. For messages forwarded from channels or from anonymous administrators, information about the original sender chat
	public let forwardFromChat: Chat?
	
	///Optional. For messages forwarded from channels, identifier of the original message in the channel
	public let forwardFromMessageId: TelegramInteger?
	
	///Optional. For forwarded messages that were originally sent in channels or by an anonymous chat administrator, signature of the message sender if present
	public let forwardSignature: String?
	
	///Optional. Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
	public let forwardSenderName: String?
	
	///Optional. For forwarded messages, date the original message was sent in Unix time
	public let forwardDate: TelegramInteger?
	
	///Optional. True, if the message is sent to a forum topic
	public let isTopicMessage: Bool?
	
	///Optional. True, if the message is a channel post that was automatically forwarded to the connected discussion group
	public let isAutomaticForward: Bool?
	
	///Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
	public let replyToMessage: Message?
	
	///Optional. Bot through which the message was sent
	public let viaBot: User?
	
	///Optional. Date the message was last edited in Unix time
	public let editDate: TelegramInteger?
	
	///Optional. True, if the message can't be forwarded
	public let hasProtectedContent: Bool?
	
	///Optional. The unique identifier of a media message group this message belongs to
	public let mediaGroupId: String?
	
	///Optional. Signature of the post author for messages in channels, or the custom title of an anonymous group administrator
	public let authorSignature: String?
	
	///Optional. For text messages, the actual UTF-8 text of the message
	public let text: String?
	
	///Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
	public let entities: [MessageEntity]?
	
	///Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
	public let animation: Animation?
	
	///Optional. Message is an audio file, information about the file
	public let audio: Audio?
	
	///Optional. Message is a general file, information about the file
	public let document: Document?
	
	///Optional. Message is a photo, available sizes of the photo
	public let photo: [PhotoSize]?
	
	///Optional. Message is a sticker, information about the sticker
	public let sticker: Sticker?
	
	///Optional. Message is a forwarded story
	public let story: Story?
	
	///Optional. Message is a video, information about the video
	public let video: Video?
	
	///Optional. Message is a video note, information about the video message
	public let videoNote: VideoNote?
	
	///Optional. Message is a voice message, information about the file
	public let voice: Voice?
	
	///Optional. Caption for the animation, audio, document, photo, video or voice
	public let caption: String?
	
	///Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
	public let captionEntities: [MessageEntity]?
	
	///Optional. True, if the message media is covered by a spoiler animation
	public let hasMediaSpoiler: Bool?
	
	///Optional. Message is a shared contact, information about the contact
	public let contact: Contact?
	
	///Optional. Message is a dice with random value
	public let dice: Dice?
	
	///Optional. Message is a game, information about the game. More about games »
	public let game: Game?
	
	///Optional. Message is a native poll, information about the poll
	public let poll: Poll?
	
	///Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
	public let venue: Venue?
	
	///Optional. Message is a shared location, information about the location
	public let location: Location?
	
	///Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
	public let newChatMembers: [User]?
	
	///Optional. A member was removed from the group, information about them (this member may be the bot itself)
	public let leftChatMember: User?
	
	///Optional. A chat title was changed to this value
	public let newChatTitle: String?
	
	///Optional. A chat photo was change to this value
	public let newChatPhoto: [PhotoSize]?
	
	///Optional. Service message: the chat photo was deleted
	public let deleteChatPhoto: Bool?
	
	///Optional. Service message: the group has been created
	public let groupChatCreated: Bool?
	
	///Optional. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
	public let supergroupChatCreated: Bool?
	
	///Optional. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
	public let channelChatCreated: Bool?
	
	///Optional. Service message: auto-delete timer settings changed in the chat
	public let messageAutoDeleteTimerChanged: MessageAutoDeleteTimerChanged?
	
	///Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
	public let migrateToChatId: TelegramInteger?
	
	///Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
	public let migrateFromChatId: TelegramInteger?
	
	///Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
	public let pinnedMessage: Message?
	
	///Optional. Message is an invoice for a payment, information about the invoice. More about payments »
	public let invoice: Invoice?
	
	///Optional. Message is a service message about a successful payment, information about the payment. More about payments »
	public let successfulPayment: SuccessfulPayment?
	
	///Optional. Service message: a user was shared with the bot
	public let userShared: UserShared?
	
	///Optional. Service message: a chat was shared with the bot
	public let chatShared: ChatShared?
	
	///Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
	public let connectedWebsite: String?
	
	///Optional. Service message: the user allowed the bot added to the attachment menu to write messages
	public let writeAccessAllowed: WriteAccessAllowed?
	
	///Optional. Telegram Passport data
	public let passportData: PassportData?
	
	///Optional. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
	public let proximityAlertTriggered: ProximityAlertTriggered?
	
	///Optional. Service message: forum topic created
	public let forumTopicCreated: ForumTopicCreated?
	
	///Optional. Service message: forum topic edited
	public let forumTopicEdited: ForumTopicEdited?
	
	///Optional. Service message: forum topic closed
	public let forumTopicClosed: ForumTopicClosed?
	
	///Optional. Service message: forum topic reopened
	public let forumTopicReopened: ForumTopicReopened?
	
	///Optional. Service message: the 'General' forum topic hidden
	public let generalForumTopicHidden: GeneralForumTopicHidden?
	
	///Optional. Service message: the 'General' forum topic unhidden
	public let generalForumTopicUnhidden: GeneralForumTopicUnhidden?
	
	///Optional. Service message: video chat scheduled
	public let videoChatScheduled: VideoChatScheduled?
	
	///Optional. Service message: video chat started
	public let videoChatStarted: VideoChatStarted?
	
	///Optional. Service message: video chat ended
	public let videoChatEnded: VideoChatEnded?
	
	///Optional. Service message: new participants invited to a video chat
	public let videoChatParticipantsInvited: VideoChatParticipantsInvited?
	
	///Optional. Service message: data sent by a Web App
	public let webAppData: WebAppData?
	
	///Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		messageId: TelegramInteger,
		messageThreadId: TelegramInteger? = nil,
		from: User? = nil,
		senderChat: Chat? = nil,
		date: TelegramInteger,
		chat: Chat,
		forwardFrom: User? = nil,
		forwardFromChat: Chat? = nil,
		forwardFromMessageId: TelegramInteger? = nil,
		forwardSignature: String? = nil,
		forwardSenderName: String? = nil,
		forwardDate: TelegramInteger? = nil,
		isTopicMessage: Bool? = nil,
		isAutomaticForward: Bool? = nil,
		replyToMessage: Message? = nil,
		viaBot: User? = nil,
		editDate: TelegramInteger? = nil,
		hasProtectedContent: Bool? = nil,
		mediaGroupId: String? = nil,
		authorSignature: String? = nil,
		text: String? = nil,
		entities: [MessageEntity]? = nil,
		animation: Animation? = nil,
		audio: Audio? = nil,
		document: Document? = nil,
		photo: [PhotoSize]? = nil,
		sticker: Sticker? = nil,
		story: Story? = nil,
		video: Video? = nil,
		videoNote: VideoNote? = nil,
		voice: Voice? = nil,
		caption: String? = nil,
		captionEntities: [MessageEntity]? = nil,
		hasMediaSpoiler: Bool? = nil,
		contact: Contact? = nil,
		dice: Dice? = nil,
		game: Game? = nil,
		poll: Poll? = nil,
		venue: Venue? = nil,
		location: Location? = nil,
		newChatMembers: [User]? = nil,
		leftChatMember: User? = nil,
		newChatTitle: String? = nil,
		newChatPhoto: [PhotoSize]? = nil,
		deleteChatPhoto: Bool? = nil,
		groupChatCreated: Bool? = nil,
		supergroupChatCreated: Bool? = nil,
		channelChatCreated: Bool? = nil,
		messageAutoDeleteTimerChanged: MessageAutoDeleteTimerChanged? = nil,
		migrateToChatId: TelegramInteger? = nil,
		migrateFromChatId: TelegramInteger? = nil,
		pinnedMessage: Message? = nil,
		invoice: Invoice? = nil,
		successfulPayment: SuccessfulPayment? = nil,
		userShared: UserShared? = nil,
		chatShared: ChatShared? = nil,
		connectedWebsite: String? = nil,
		writeAccessAllowed: WriteAccessAllowed? = nil,
		passportData: PassportData? = nil,
		proximityAlertTriggered: ProximityAlertTriggered? = nil,
		forumTopicCreated: ForumTopicCreated? = nil,
		forumTopicEdited: ForumTopicEdited? = nil,
		forumTopicClosed: ForumTopicClosed? = nil,
		forumTopicReopened: ForumTopicReopened? = nil,
		generalForumTopicHidden: GeneralForumTopicHidden? = nil,
		generalForumTopicUnhidden: GeneralForumTopicUnhidden? = nil,
		videoChatScheduled: VideoChatScheduled? = nil,
		videoChatStarted: VideoChatStarted? = nil,
		videoChatEnded: VideoChatEnded? = nil,
		videoChatParticipantsInvited: VideoChatParticipantsInvited? = nil,
		webAppData: WebAppData? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.messageId = messageId
		self.messageThreadId = messageThreadId
		self.from = from
		self.senderChat = senderChat
		self.date = date
		self.chat = chat
		self.forwardFrom = forwardFrom
		self.forwardFromChat = forwardFromChat
		self.forwardFromMessageId = forwardFromMessageId
		self.forwardSignature = forwardSignature
		self.forwardSenderName = forwardSenderName
		self.forwardDate = forwardDate
		self.isTopicMessage = isTopicMessage
		self.isAutomaticForward = isAutomaticForward
		self.replyToMessage = replyToMessage
		self.viaBot = viaBot
		self.editDate = editDate
		self.hasProtectedContent = hasProtectedContent
		self.mediaGroupId = mediaGroupId
		self.authorSignature = authorSignature
		self.text = text
		self.entities = entities
		self.animation = animation
		self.audio = audio
		self.document = document
		self.photo = photo
		self.sticker = sticker
		self.story = story
		self.video = video
		self.videoNote = videoNote
		self.voice = voice
		self.caption = caption
		self.captionEntities = captionEntities
		self.hasMediaSpoiler = hasMediaSpoiler
		self.contact = contact
		self.dice = dice
		self.game = game
		self.poll = poll
		self.venue = venue
		self.location = location
		self.newChatMembers = newChatMembers
		self.leftChatMember = leftChatMember
		self.newChatTitle = newChatTitle
		self.newChatPhoto = newChatPhoto
		self.deleteChatPhoto = deleteChatPhoto
		self.groupChatCreated = groupChatCreated
		self.supergroupChatCreated = supergroupChatCreated
		self.channelChatCreated = channelChatCreated
		self.messageAutoDeleteTimerChanged = messageAutoDeleteTimerChanged
		self.migrateToChatId = migrateToChatId
		self.migrateFromChatId = migrateFromChatId
		self.pinnedMessage = pinnedMessage
		self.invoice = invoice
		self.successfulPayment = successfulPayment
		self.userShared = userShared
		self.chatShared = chatShared
		self.connectedWebsite = connectedWebsite
		self.writeAccessAllowed = writeAccessAllowed
		self.passportData = passportData
		self.proximityAlertTriggered = proximityAlertTriggered
		self.forumTopicCreated = forumTopicCreated
		self.forumTopicEdited = forumTopicEdited
		self.forumTopicClosed = forumTopicClosed
		self.forumTopicReopened = forumTopicReopened
		self.generalForumTopicHidden = generalForumTopicHidden
		self.generalForumTopicUnhidden = generalForumTopicUnhidden
		self.videoChatScheduled = videoChatScheduled
		self.videoChatStarted = videoChatStarted
		self.videoChatEnded = videoChatEnded
		self.videoChatParticipantsInvited = videoChatParticipantsInvited
		self.webAppData = webAppData
		self.replyMarkup = replyMarkup
	}

	private enum CodingKeys: String, CodingKey {
		case messageId = "message_id"
		case messageThreadId = "message_thread_id"
		case from
		case senderChat = "sender_chat"
		case date
		case chat
		case forwardFrom = "forward_from"
		case forwardFromChat = "forward_from_chat"
		case forwardFromMessageId = "forward_from_message_id"
		case forwardSignature = "forward_signature"
		case forwardSenderName = "forward_sender_name"
		case forwardDate = "forward_date"
		case isTopicMessage = "is_topic_message"
		case isAutomaticForward = "is_automatic_forward"
		case replyToMessage = "reply_to_message"
		case viaBot = "via_bot"
		case editDate = "edit_date"
		case hasProtectedContent = "has_protected_content"
		case mediaGroupId = "media_group_id"
		case authorSignature = "author_signature"
		case text
		case entities
		case animation
		case audio
		case document
		case photo
		case sticker
		case story
		case video
		case videoNote = "video_note"
		case voice
		case caption
		case captionEntities = "caption_entities"
		case hasMediaSpoiler = "has_media_spoiler"
		case contact
		case dice
		case game
		case poll
		case venue
		case location
		case newChatMembers = "new_chat_members"
		case leftChatMember = "left_chat_member"
		case newChatTitle = "new_chat_title"
		case newChatPhoto = "new_chat_photo"
		case deleteChatPhoto = "delete_chat_photo"
		case groupChatCreated = "group_chat_created"
		case supergroupChatCreated = "supergroup_chat_created"
		case channelChatCreated = "channel_chat_created"
		case messageAutoDeleteTimerChanged = "message_auto_delete_timer_changed"
		case migrateToChatId = "migrate_to_chat_id"
		case migrateFromChatId = "migrate_from_chat_id"
		case pinnedMessage = "pinned_message"
		case invoice
		case successfulPayment = "successful_payment"
		case userShared = "user_shared"
		case chatShared = "chat_shared"
		case connectedWebsite = "connected_website"
		case writeAccessAllowed = "write_access_allowed"
		case passportData = "passport_data"
		case proximityAlertTriggered = "proximity_alert_triggered"
		case forumTopicCreated = "forum_topic_created"
		case forumTopicEdited = "forum_topic_edited"
		case forumTopicClosed = "forum_topic_closed"
		case forumTopicReopened = "forum_topic_reopened"
		case generalForumTopicHidden = "general_forum_topic_hidden"
		case generalForumTopicUnhidden = "general_forum_topic_unhidden"
		case videoChatScheduled = "video_chat_scheduled"
		case videoChatStarted = "video_chat_started"
		case videoChatEnded = "video_chat_ended"
		case videoChatParticipantsInvited = "video_chat_participants_invited"
		case webAppData = "web_app_data"
		case replyMarkup = "reply_markup"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.messageId.self, forKey: .messageId)
		try container.encodeIfPresent(self.messageThreadId.self, forKey: .messageThreadId)
		try container.encodeIfPresent(self.from.self, forKey: .from)
		try container.encodeIfPresent(self.senderChat.self, forKey: .senderChat)
		try container.encode(self.date.self, forKey: .date)
		try container.encode(self.chat.self, forKey: .chat)
		try container.encodeIfPresent(self.forwardFrom.self, forKey: .forwardFrom)
		try container.encodeIfPresent(self.forwardFromChat.self, forKey: .forwardFromChat)
		try container.encodeIfPresent(self.forwardFromMessageId.self, forKey: .forwardFromMessageId)
		try container.encodeIfPresent(self.forwardSignature.self, forKey: .forwardSignature)
		try container.encodeIfPresent(self.forwardSenderName.self, forKey: .forwardSenderName)
		try container.encodeIfPresent(self.forwardDate.self, forKey: .forwardDate)
		try container.encodeIfPresent(self.isTopicMessage.self, forKey: .isTopicMessage)
		try container.encodeIfPresent(self.isAutomaticForward.self, forKey: .isAutomaticForward)
		try container.encodeIfPresent(self.replyToMessage.self, forKey: .replyToMessage)
		try container.encodeIfPresent(self.viaBot.self, forKey: .viaBot)
		try container.encodeIfPresent(self.editDate.self, forKey: .editDate)
		try container.encodeIfPresent(self.hasProtectedContent.self, forKey: .hasProtectedContent)
		try container.encodeIfPresent(self.mediaGroupId.self, forKey: .mediaGroupId)
		try container.encodeIfPresent(self.authorSignature.self, forKey: .authorSignature)
		try container.encodeIfPresent(self.text.self, forKey: .text)
		try container.encodeIfPresent(self.entities.self, forKey: .entities)
		try container.encodeIfPresent(self.animation.self, forKey: .animation)
		try container.encodeIfPresent(self.audio.self, forKey: .audio)
		try container.encodeIfPresent(self.document.self, forKey: .document)
		try container.encodeIfPresent(self.photo.self, forKey: .photo)
		try container.encodeIfPresent(self.sticker.self, forKey: .sticker)
		try container.encodeIfPresent(self.story.self, forKey: .story)
		try container.encodeIfPresent(self.video.self, forKey: .video)
		try container.encodeIfPresent(self.videoNote.self, forKey: .videoNote)
		try container.encodeIfPresent(self.voice.self, forKey: .voice)
		try container.encodeIfPresent(self.caption.self, forKey: .caption)
		try container.encodeIfPresent(self.captionEntities.self, forKey: .captionEntities)
		try container.encodeIfPresent(self.hasMediaSpoiler.self, forKey: .hasMediaSpoiler)
		try container.encodeIfPresent(self.contact.self, forKey: .contact)
		try container.encodeIfPresent(self.dice.self, forKey: .dice)
		try container.encodeIfPresent(self.game.self, forKey: .game)
		try container.encodeIfPresent(self.poll.self, forKey: .poll)
		try container.encodeIfPresent(self.venue.self, forKey: .venue)
		try container.encodeIfPresent(self.location.self, forKey: .location)
		try container.encodeIfPresent(self.newChatMembers.self, forKey: .newChatMembers)
		try container.encodeIfPresent(self.leftChatMember.self, forKey: .leftChatMember)
		try container.encodeIfPresent(self.newChatTitle.self, forKey: .newChatTitle)
		try container.encodeIfPresent(self.newChatPhoto.self, forKey: .newChatPhoto)
		try container.encodeIfPresent(self.deleteChatPhoto.self, forKey: .deleteChatPhoto)
		try container.encodeIfPresent(self.groupChatCreated.self, forKey: .groupChatCreated)
		try container.encodeIfPresent(self.supergroupChatCreated.self, forKey: .supergroupChatCreated)
		try container.encodeIfPresent(self.channelChatCreated.self, forKey: .channelChatCreated)
		try container.encodeIfPresent(self.messageAutoDeleteTimerChanged.self, forKey: .messageAutoDeleteTimerChanged)
		try container.encodeIfPresent(self.migrateToChatId.self, forKey: .migrateToChatId)
		try container.encodeIfPresent(self.migrateFromChatId.self, forKey: .migrateFromChatId)
		try container.encodeIfPresent(self.pinnedMessage.self, forKey: .pinnedMessage)
		try container.encodeIfPresent(self.invoice.self, forKey: .invoice)
		try container.encodeIfPresent(self.successfulPayment.self, forKey: .successfulPayment)
		try container.encodeIfPresent(self.userShared.self, forKey: .userShared)
		try container.encodeIfPresent(self.chatShared.self, forKey: .chatShared)
		try container.encodeIfPresent(self.connectedWebsite.self, forKey: .connectedWebsite)
		try container.encodeIfPresent(self.writeAccessAllowed.self, forKey: .writeAccessAllowed)
		try container.encodeIfPresent(self.passportData.self, forKey: .passportData)
		try container.encodeIfPresent(self.proximityAlertTriggered.self, forKey: .proximityAlertTriggered)
		try container.encodeIfPresent(self.forumTopicCreated.self, forKey: .forumTopicCreated)
		try container.encodeIfPresent(self.forumTopicEdited.self, forKey: .forumTopicEdited)
		try container.encodeIfPresent(self.forumTopicClosed.self, forKey: .forumTopicClosed)
		try container.encodeIfPresent(self.forumTopicReopened.self, forKey: .forumTopicReopened)
		try container.encodeIfPresent(self.generalForumTopicHidden.self, forKey: .generalForumTopicHidden)
		try container.encodeIfPresent(self.generalForumTopicUnhidden.self, forKey: .generalForumTopicUnhidden)
		try container.encodeIfPresent(self.videoChatScheduled.self, forKey: .videoChatScheduled)
		try container.encodeIfPresent(self.videoChatStarted.self, forKey: .videoChatStarted)
		try container.encodeIfPresent(self.videoChatEnded.self, forKey: .videoChatEnded)
		try container.encodeIfPresent(self.videoChatParticipantsInvited.self, forKey: .videoChatParticipantsInvited)
		try container.encodeIfPresent(self.webAppData.self, forKey: .webAppData)
		try container.encodeIfPresent(self.replyMarkup.self, forKey: .replyMarkup)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.messageId = try container.decode(TelegramInteger.self, forKey: .messageId)
		self.messageThreadId = try container.decodeIfPresent(TelegramInteger.self, forKey: .messageThreadId)
		self.from = try container.decodeIfPresent(User.self, forKey: .from)
		self.senderChat = try container.decodeIfPresent(Chat.self, forKey: .senderChat)
		self.date = try container.decode(TelegramInteger.self, forKey: .date)
		self.chat = try container.decode(Chat.self, forKey: .chat)
		self.forwardFrom = try container.decodeIfPresent(User.self, forKey: .forwardFrom)
		self.forwardFromChat = try container.decodeIfPresent(Chat.self, forKey: .forwardFromChat)
		self.forwardFromMessageId = try container.decodeIfPresent(TelegramInteger.self, forKey: .forwardFromMessageId)
		self.forwardSignature = try container.decodeIfPresent(String.self, forKey: .forwardSignature)
		self.forwardSenderName = try container.decodeIfPresent(String.self, forKey: .forwardSenderName)
		self.forwardDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .forwardDate)
		self.isTopicMessage = try container.decodeIfPresent(Bool.self, forKey: .isTopicMessage)
		self.isAutomaticForward = try container.decodeIfPresent(Bool.self, forKey: .isAutomaticForward)
		self.replyToMessage = try container.decodeIfPresent(Message.self, forKey: .replyToMessage)
		self.viaBot = try container.decodeIfPresent(User.self, forKey: .viaBot)
		self.editDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .editDate)
		self.hasProtectedContent = try container.decodeIfPresent(Bool.self, forKey: .hasProtectedContent)
		self.mediaGroupId = try container.decodeIfPresent(String.self, forKey: .mediaGroupId)
		self.authorSignature = try container.decodeIfPresent(String.self, forKey: .authorSignature)
		self.text = try container.decodeIfPresent(String.self, forKey: .text)
		self.entities = try container.decodeIfPresent([MessageEntity].self, forKey: .entities)
		self.animation = try container.decodeIfPresent(Animation.self, forKey: .animation)
		self.audio = try container.decodeIfPresent(Audio.self, forKey: .audio)
		self.document = try container.decodeIfPresent(Document.self, forKey: .document)
		self.photo = try container.decodeIfPresent([PhotoSize].self, forKey: .photo)
		self.sticker = try container.decodeIfPresent(Sticker.self, forKey: .sticker)
		self.story = try container.decodeIfPresent(Story.self, forKey: .story)
		self.video = try container.decodeIfPresent(Video.self, forKey: .video)
		self.videoNote = try container.decodeIfPresent(VideoNote.self, forKey: .videoNote)
		self.voice = try container.decodeIfPresent(Voice.self, forKey: .voice)
		self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
		self.captionEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .captionEntities)
		self.hasMediaSpoiler = try container.decodeIfPresent(Bool.self, forKey: .hasMediaSpoiler)
		self.contact = try container.decodeIfPresent(Contact.self, forKey: .contact)
		self.dice = try container.decodeIfPresent(Dice.self, forKey: .dice)
		self.game = try container.decodeIfPresent(Game.self, forKey: .game)
		self.poll = try container.decodeIfPresent(Poll.self, forKey: .poll)
		self.venue = try container.decodeIfPresent(Venue.self, forKey: .venue)
		self.location = try container.decodeIfPresent(Location.self, forKey: .location)
		self.newChatMembers = try container.decodeIfPresent([User].self, forKey: .newChatMembers)
		self.leftChatMember = try container.decodeIfPresent(User.self, forKey: .leftChatMember)
		self.newChatTitle = try container.decodeIfPresent(String.self, forKey: .newChatTitle)
		self.newChatPhoto = try container.decodeIfPresent([PhotoSize].self, forKey: .newChatPhoto)
		self.deleteChatPhoto = try container.decodeIfPresent(Bool.self, forKey: .deleteChatPhoto)
		self.groupChatCreated = try container.decodeIfPresent(Bool.self, forKey: .groupChatCreated)
		self.supergroupChatCreated = try container.decodeIfPresent(Bool.self, forKey: .supergroupChatCreated)
		self.channelChatCreated = try container.decodeIfPresent(Bool.self, forKey: .channelChatCreated)
		self.messageAutoDeleteTimerChanged = try container.decodeIfPresent(MessageAutoDeleteTimerChanged.self, forKey: .messageAutoDeleteTimerChanged)
		self.migrateToChatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .migrateToChatId)
		self.migrateFromChatId = try container.decodeIfPresent(TelegramInteger.self, forKey: .migrateFromChatId)
		self.pinnedMessage = try container.decodeIfPresent(Message.self, forKey: .pinnedMessage)
		self.invoice = try container.decodeIfPresent(Invoice.self, forKey: .invoice)
		self.successfulPayment = try container.decodeIfPresent(SuccessfulPayment.self, forKey: .successfulPayment)
		self.userShared = try container.decodeIfPresent(UserShared.self, forKey: .userShared)
		self.chatShared = try container.decodeIfPresent(ChatShared.self, forKey: .chatShared)
		self.connectedWebsite = try container.decodeIfPresent(String.self, forKey: .connectedWebsite)
		self.writeAccessAllowed = try container.decodeIfPresent(WriteAccessAllowed.self, forKey: .writeAccessAllowed)
		self.passportData = try container.decodeIfPresent(PassportData.self, forKey: .passportData)
		self.proximityAlertTriggered = try container.decodeIfPresent(ProximityAlertTriggered.self, forKey: .proximityAlertTriggered)
		self.forumTopicCreated = try container.decodeIfPresent(ForumTopicCreated.self, forKey: .forumTopicCreated)
		self.forumTopicEdited = try container.decodeIfPresent(ForumTopicEdited.self, forKey: .forumTopicEdited)
		self.forumTopicClosed = try container.decodeIfPresent(ForumTopicClosed.self, forKey: .forumTopicClosed)
		self.forumTopicReopened = try container.decodeIfPresent(ForumTopicReopened.self, forKey: .forumTopicReopened)
		self.generalForumTopicHidden = try container.decodeIfPresent(GeneralForumTopicHidden.self, forKey: .generalForumTopicHidden)
		self.generalForumTopicUnhidden = try container.decodeIfPresent(GeneralForumTopicUnhidden.self, forKey: .generalForumTopicUnhidden)
		self.videoChatScheduled = try container.decodeIfPresent(VideoChatScheduled.self, forKey: .videoChatScheduled)
		self.videoChatStarted = try container.decodeIfPresent(VideoChatStarted.self, forKey: .videoChatStarted)
		self.videoChatEnded = try container.decodeIfPresent(VideoChatEnded.self, forKey: .videoChatEnded)
		self.videoChatParticipantsInvited = try container.decodeIfPresent(VideoChatParticipantsInvited.self, forKey: .videoChatParticipantsInvited)
		self.webAppData = try container.decodeIfPresent(WebAppData.self, forKey: .webAppData)
		self.replyMarkup = try container.decodeIfPresent(InlineKeyboardMarkup.self, forKey: .replyMarkup)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("message_id", object: self.messageId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("from", object: self.from)
		encoder.append("sender_chat", object: self.senderChat)
		encoder.append("date", object: self.date)
		encoder.append("chat", object: self.chat)
		encoder.append("forward_from", object: self.forwardFrom)
		encoder.append("forward_from_chat", object: self.forwardFromChat)
		encoder.append("forward_from_message_id", object: self.forwardFromMessageId)
		encoder.append("forward_signature", object: self.forwardSignature)
		encoder.append("forward_sender_name", object: self.forwardSenderName)
		encoder.append("forward_date", object: self.forwardDate)
		encoder.append("is_topic_message", object: self.isTopicMessage)
		encoder.append("is_automatic_forward", object: self.isAutomaticForward)
		encoder.append("reply_to_message", object: self.replyToMessage)
		encoder.append("via_bot", object: self.viaBot)
		encoder.append("edit_date", object: self.editDate)
		encoder.append("has_protected_content", object: self.hasProtectedContent)
		encoder.append("media_group_id", object: self.mediaGroupId)
		encoder.append("author_signature", object: self.authorSignature)
		encoder.append("text", object: self.text)
		encoder.append("entities", object: self.entities)
		encoder.append("animation", object: self.animation)
		encoder.append("audio", object: self.audio)
		encoder.append("document", object: self.document)
		encoder.append("photo", object: self.photo)
		encoder.append("sticker", object: self.sticker)
		encoder.append("story", object: self.story)
		encoder.append("video", object: self.video)
		encoder.append("video_note", object: self.videoNote)
		encoder.append("voice", object: self.voice)
		encoder.append("caption", object: self.caption)
		encoder.append("caption_entities", object: self.captionEntities)
		encoder.append("has_media_spoiler", object: self.hasMediaSpoiler)
		encoder.append("contact", object: self.contact)
		encoder.append("dice", object: self.dice)
		encoder.append("game", object: self.game)
		encoder.append("poll", object: self.poll)
		encoder.append("venue", object: self.venue)
		encoder.append("location", object: self.location)
		encoder.append("new_chat_members", object: self.newChatMembers)
		encoder.append("left_chat_member", object: self.leftChatMember)
		encoder.append("new_chat_title", object: self.newChatTitle)
		encoder.append("new_chat_photo", object: self.newChatPhoto)
		encoder.append("delete_chat_photo", object: self.deleteChatPhoto)
		encoder.append("group_chat_created", object: self.groupChatCreated)
		encoder.append("supergroup_chat_created", object: self.supergroupChatCreated)
		encoder.append("channel_chat_created", object: self.channelChatCreated)
		encoder.append("message_auto_delete_timer_changed", object: self.messageAutoDeleteTimerChanged)
		encoder.append("migrate_to_chat_id", object: self.migrateToChatId)
		encoder.append("migrate_from_chat_id", object: self.migrateFromChatId)
		encoder.append("pinned_message", object: self.pinnedMessage)
		encoder.append("invoice", object: self.invoice)
		encoder.append("successful_payment", object: self.successfulPayment)
		encoder.append("user_shared", object: self.userShared)
		encoder.append("chat_shared", object: self.chatShared)
		encoder.append("connected_website", object: self.connectedWebsite)
		encoder.append("write_access_allowed", object: self.writeAccessAllowed)
		encoder.append("passport_data", object: self.passportData)
		encoder.append("proximity_alert_triggered", object: self.proximityAlertTriggered)
		encoder.append("forum_topic_created", object: self.forumTopicCreated)
		encoder.append("forum_topic_edited", object: self.forumTopicEdited)
		encoder.append("forum_topic_closed", object: self.forumTopicClosed)
		encoder.append("forum_topic_reopened", object: self.forumTopicReopened)
		encoder.append("general_forum_topic_hidden", object: self.generalForumTopicHidden)
		encoder.append("general_forum_topic_unhidden", object: self.generalForumTopicUnhidden)
		encoder.append("video_chat_scheduled", object: self.videoChatScheduled)
		encoder.append("video_chat_started", object: self.videoChatStarted)
		encoder.append("video_chat_ended", object: self.videoChatEnded)
		encoder.append("video_chat_participants_invited", object: self.videoChatParticipantsInvited)
		encoder.append("web_app_data", object: self.webAppData)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
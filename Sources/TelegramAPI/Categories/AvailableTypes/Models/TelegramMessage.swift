//
//  TelegramMessage.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a message.
public final class TelegramMessage
{

	///Unique message identifier inside this chat
	public let messageId: TelegramInteger

	///Optional. Sender, empty for messages sent to channels
	public let from: TelegramUser?

	///Date the message was sent in Unix time
	public let date: TelegramInteger

	///Conversation the message belongs to
	public let chat: TelegramChat

	///Optional. For forwarded messages, sender of the original message
	public let forwardFrom: TelegramUser?

	///Optional. For messages forwarded from channels, information about the original channel
	public let forwardFromChat: TelegramChat?

	///Optional. For messages forwarded from channels, identifier of the original message in the channel
	public let forwardFromMessageId: TelegramInteger?

	///Optional. For messages forwarded from channels, signature of the post author if present
	public let forwardSignature: String?

	///Optional. Sender&#39;s name for messages forwarded from users who disallow adding a link to their account in forwarded messages
	public let forwardSenderName: String?

	///Optional. For forwarded messages, date the original message was sent in Unix time
	public let forwardDate: TelegramInteger?

	///Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
	public let replyToMessage: TelegramMessage?

	///Optional. Date the message was last edited in Unix time
	public let editDate: TelegramInteger?

	///Optional. The unique identifier of a media message group this message belongs to
	public let mediaGroupId: String?

	///Optional. Signature of the post author for messages in channels
	public let authorSignature: String?

	///Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters.
	public let text: String?

	///Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
	public let entities: [TelegramMessageEntity]?

	///Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
	public let captionEntities: [TelegramMessageEntity]?

	///Optional. Message is an audio file, information about the file
	public let audio: TelegramAudio?

	///Optional. Message is a general file, information about the file
	public let document: TelegramDocument?

	///Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
	public let animation: TelegramAnimation?

	///Optional. Message is a game, information about the game. More about games »
	public let game: TelegramGame?

	///Optional. Message is a photo, available sizes of the photo
	public let photo: [TelegramPhotoSize]?

	///Optional. Message is a sticker, information about the sticker
	public let sticker: TelegramSticker?

	///Optional. Message is a video, information about the video
	public let video: TelegramVideo?

	///Optional. Message is a voice message, information about the file
	public let voice: TelegramVoice?

	///Optional. Message is a video note, information about the video message
	public let videoNote: TelegramVideoNote?

	///Optional. Caption for the animation, audio, document, photo, video or voice, 0-1024 characters
	public let caption: String?

	///Optional. Message is a shared contact, information about the contact
	public let contact: TelegramContact?

	///Optional. Message is a shared location, information about the location
	public let location: TelegramLocation?

	///Optional. Message is a venue, information about the venue
	public let venue: TelegramVenue?

	///Optional. Message is a native poll, information about the poll
	public let poll: TelegramPoll?

	///Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
	public let newChatMembers: [TelegramUser]?

	///Optional. A member was removed from the group, information about them (this member may be the bot itself)
	public let leftChatMember: TelegramUser?

	///Optional. A chat title was changed to this value
	public let newChatTitle: String?

	///Optional. A chat photo was change to this value
	public let newChatPhoto: [TelegramPhotoSize]?

	///Optional. Service message: the chat photo was deleted
	public let deleteChatPhoto: Bool?

	///Optional. Service message: the group has been created
	public let groupChatCreated: Bool?

	///Optional. Service message: the supergroup has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
	public let supergroupChatCreated: Bool?

	///Optional. Service message: the channel has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
	public let channelChatCreated: Bool?

	///Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	public let migrateToChatId: TelegramInteger?

	///Optional. The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	public let migrateFromChatId: TelegramInteger?

	///Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
	public let pinnedMessage: TelegramMessage?

	///Optional. Message is an invoice for a payment, information about the invoice. More about payments »
	public let invoice: TelegramInvoice?

	///Optional. Message is a service message about a successful payment, information about the payment. More about payments »
	public let successfulPayment: TelegramSuccessfulPayment?

	///Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
	public let connectedWebsite: String?

	///Optional. Telegram Passport data
	public let passportData: TelegramPassportData?

	///Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(messageId: TelegramInteger,
                from: TelegramUser? = nil,
                date: TelegramInteger,
                chat: TelegramChat,
                forwardFrom: TelegramUser? = nil,
                forwardFromChat: TelegramChat? = nil,
                forwardFromMessageId: TelegramInteger? = nil,
                forwardSignature: String? = nil,
                forwardSenderName: String? = nil,
                forwardDate: TelegramInteger? = nil,
                replyToMessage: TelegramMessage? = nil,
                editDate: TelegramInteger? = nil,
                mediaGroupId: String? = nil,
                authorSignature: String? = nil,
                text: String? = nil,
                entities: [TelegramMessageEntity]? = nil,
                captionEntities: [TelegramMessageEntity]? = nil,
                audio: TelegramAudio? = nil,
                document: TelegramDocument? = nil,
                animation: TelegramAnimation? = nil,
                game: TelegramGame? = nil,
                photo: [TelegramPhotoSize]? = nil,
                sticker: TelegramSticker? = nil,
                video: TelegramVideo? = nil,
                voice: TelegramVoice? = nil,
                videoNote: TelegramVideoNote? = nil,
                caption: String? = nil,
                contact: TelegramContact? = nil,
                location: TelegramLocation? = nil,
                venue: TelegramVenue? = nil,
                poll: TelegramPoll? = nil,
                newChatMembers: [TelegramUser]? = nil,
                leftChatMember: TelegramUser? = nil,
                newChatTitle: String? = nil,
                newChatPhoto: [TelegramPhotoSize]? = nil,
                deleteChatPhoto: Bool? = nil,
                groupChatCreated: Bool? = nil,
                supergroupChatCreated: Bool? = nil,
                channelChatCreated: Bool? = nil,
                migrateToChatId: TelegramInteger? = nil,
                migrateFromChatId: TelegramInteger? = nil,
                pinnedMessage: TelegramMessage? = nil,
                invoice: TelegramInvoice? = nil,
                successfulPayment: TelegramSuccessfulPayment? = nil,
                connectedWebsite: String? = nil,
                passportData: TelegramPassportData? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.messageId = messageId
		self.from = from
		self.date = date
		self.chat = chat
		self.forwardFrom = forwardFrom
		self.forwardFromChat = forwardFromChat
		self.forwardFromMessageId = forwardFromMessageId
		self.forwardSignature = forwardSignature
		self.forwardSenderName = forwardSenderName
		self.forwardDate = forwardDate
		self.replyToMessage = replyToMessage
		self.editDate = editDate
		self.mediaGroupId = mediaGroupId
		self.authorSignature = authorSignature
		self.text = text
		self.entities = entities
		self.captionEntities = captionEntities
		self.audio = audio
		self.document = document
		self.animation = animation
		self.game = game
		self.photo = photo
		self.sticker = sticker
		self.video = video
		self.voice = voice
		self.videoNote = videoNote
		self.caption = caption
		self.contact = contact
		self.location = location
		self.venue = venue
		self.poll = poll
		self.newChatMembers = newChatMembers
		self.leftChatMember = leftChatMember
		self.newChatTitle = newChatTitle
		self.newChatPhoto = newChatPhoto
		self.deleteChatPhoto = deleteChatPhoto
		self.groupChatCreated = groupChatCreated
		self.supergroupChatCreated = supergroupChatCreated
		self.channelChatCreated = channelChatCreated
		self.migrateToChatId = migrateToChatId
		self.migrateFromChatId = migrateFromChatId
		self.pinnedMessage = pinnedMessage
		self.invoice = invoice
		self.successfulPayment = successfulPayment
		self.connectedWebsite = connectedWebsite
		self.passportData = passportData
		self.replyMarkup = replyMarkup
	}

}

extension TelegramMessage: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case messageId = "message_id"
		case from
		case date
		case chat
		case forwardFrom = "forward_from"
		case forwardFromChat = "forward_from_chat"
		case forwardFromMessageId = "forward_from_message_id"
		case forwardSignature = "forward_signature"
		case forwardSenderName = "forward_sender_name"
		case forwardDate = "forward_date"
		case replyToMessage = "reply_to_message"
		case editDate = "edit_date"
		case mediaGroupId = "media_group_id"
		case authorSignature = "author_signature"
		case text
		case entities
		case captionEntities = "caption_entities"
		case audio
		case document
		case animation
		case game
		case photo
		case sticker
		case video
		case voice
		case videoNote = "video_note"
		case caption
		case contact
		case location
		case venue
		case poll
		case newChatMembers = "new_chat_members"
		case leftChatMember = "left_chat_member"
		case newChatTitle = "new_chat_title"
		case newChatPhoto = "new_chat_photo"
		case deleteChatPhoto = "delete_chat_photo"
		case groupChatCreated = "group_chat_created"
		case supergroupChatCreated = "supergroup_chat_created"
		case channelChatCreated = "channel_chat_created"
		case migrateToChatId = "migrate_to_chat_id"
		case migrateFromChatId = "migrate_from_chat_id"
		case pinnedMessage = "pinned_message"
		case invoice
		case successfulPayment = "successful_payment"
		case connectedWebsite = "connected_website"
		case passportData = "passport_data"
		case replyMarkup = "reply_markup"
	}

}

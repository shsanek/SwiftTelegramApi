//
//  TelegramInlineQueryResultContact.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.
public struct TelegramInlineQueryResultContact
{

	///Type of the result, must be contact
	public let type: String

	///Unique identifier for this result, 1-64 Bytes
	public let id: String

	///Contact&#39;s phone number
	public let phoneNumber: String

	///Contact&#39;s first name
	public let firstName: String

	///Optional. Contact&#39;s last name
	public let lastName: String?

	///Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
	public let vcard: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the contact
	public let inputMessageContent: TelegramInputMessageContent?

	///Optional. Url of the thumbnail for the result
	public let thumbUrl: String?

	///Optional. Thumbnail width
	public let thumbWidth: TelegramInteger?

	///Optional. Thumbnail height
	public let thumbHeight: TelegramInteger?

	public init(type: String,
                id: String,
                phoneNumber: String,
                firstName: String,
                lastName: String? = nil,
                vcard: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil,
                thumbUrl: String? = nil,
                thumbWidth: TelegramInteger? = nil,
                thumbHeight: TelegramInteger? = nil)
	{
		self.type = type
		self.id = id
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.vcard = vcard
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
		self.thumbUrl = thumbUrl
		self.thumbWidth = thumbWidth
		self.thumbHeight = thumbHeight
	}

}

extension TelegramInlineQueryResultContact: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case vcard
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
		case thumbUrl = "thumb_url"
		case thumbWidth = "thumb_width"
		case thumbHeight = "thumb_height"
	}

}

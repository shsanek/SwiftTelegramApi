//
//  TelegramAPI+SendContact.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to send phone contacts. On success, the sent Message is returned.
	public func sendContact(_ input: TelegramSendContactInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendContact", object: input, completion: completionHandler)
	}

}


public struct TelegramSendContactInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Contact&#39;s phone number
	public let phoneNumber: String

	///Contact&#39;s first name
	public let firstName: String

	///Contact&#39;s last name
	public let lastName: String?

	///Additional data about the contact in the form of a vCard, 0-2048 bytes
	public let vcard: String?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                phoneNumber: String,
                firstName: String,
                lastName: String? = nil,
                vcard: String? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.vcard = vcard
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendContactInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case vcard
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

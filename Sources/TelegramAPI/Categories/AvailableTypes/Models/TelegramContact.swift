//
//  TelegramContact.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a phone contact.
public struct TelegramContact
{

	///Contact&#39;s phone number
	public let phoneNumber: String

	///Contact&#39;s first name
	public let firstName: String

	///Optional. Contact&#39;s last name
	public let lastName: String?

	///Optional. Contact&#39;s user identifier in Telegram
	public let userId: TelegramInteger?

	///Optional. Additional data about the contact in the form of a vCard
	public let vcard: String?

	public init(phoneNumber: String,
                firstName: String,
                lastName: String? = nil,
                userId: TelegramInteger? = nil,
                vcard: String? = nil)
	{
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.userId = userId
		self.vcard = vcard
	}

}

extension TelegramContact: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case userId = "user_id"
		case vcard
	}

}
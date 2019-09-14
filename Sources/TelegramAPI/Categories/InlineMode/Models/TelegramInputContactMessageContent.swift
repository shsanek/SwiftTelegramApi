//
//  TelegramInputContactMessageContent.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents the content of a contact message to be sent as the result of an inline query.
public struct TelegramInputContactMessageContent
{

	///Contact&#39;s phone number
	public let phoneNumber: String

	///Contact&#39;s first name
	public let firstName: String

	///Optional. Contact&#39;s last name
	public let lastName: String?

	///Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
	public let vcard: String?

	public init(phoneNumber: String,
                firstName: String,
                lastName: String? = nil,
                vcard: String? = nil)
	{
		self.phoneNumber = phoneNumber
		self.firstName = firstName
		self.lastName = lastName
		self.vcard = vcard
	}

}

extension TelegramInputContactMessageContent: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case phoneNumber = "phone_number"
		case firstName = "first_name"
		case lastName = "last_name"
		case vcard
	}

}

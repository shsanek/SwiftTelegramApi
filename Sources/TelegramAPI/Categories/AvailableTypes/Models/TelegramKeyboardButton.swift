//
//  TelegramKeyboardButton.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents one button of the reply keyboard. For simple text buttons String can be used instead of this object to specify text of the button. Optional fields are mutually exclusive.
public struct TelegramKeyboardButton
{

	///Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed
	public let text: String

	///Optional. If True, the user&#39;s phone number will be sent as a contact when the button is pressed. Available in private chats only
	public let requestContact: Bool?

	///Optional. If True, the user&#39;s current location will be sent when the button is pressed. Available in private chats only
	public let requestLocation: Bool?

	public init(text: String,
                requestContact: Bool? = nil,
                requestLocation: Bool? = nil)
	{
		self.text = text
		self.requestContact = requestContact
		self.requestLocation = requestLocation
	}

}

extension TelegramKeyboardButton: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case text
		case requestContact = "request_contact"
		case requestLocation = "request_location"
	}

}

//
//  TelegramUser.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a Telegram user or bot.
public struct TelegramUser
{

	///Unique identifier for this user or bot
	public let id: TelegramInteger

	///True, if this user is a bot
	public let isBot: Bool

	///User‘s or bot’s first name
	public let firstName: String

	///Optional. User‘s or bot’s last name
	public let lastName: String?

	///Optional. User‘s or bot’s username
	public let username: String?

	///Optional. IETF language tag of the user&#39;s language
	public let languageCode: String?

	public init(id: TelegramInteger,
                isBot: Bool,
                firstName: String,
                lastName: String? = nil,
                username: String? = nil,
                languageCode: String? = nil)
	{
		self.id = id
		self.isBot = isBot
		self.firstName = firstName
		self.lastName = lastName
		self.username = username
		self.languageCode = languageCode
	}

}

extension TelegramUser: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case id
		case isBot = "is_bot"
		case firstName = "first_name"
		case lastName = "last_name"
		case username
		case languageCode = "language_code"
	}

}

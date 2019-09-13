//
//  TelegramMessageEntity.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
public struct TelegramMessageEntity
{

	///Type of the entity. Can be mention (@username), hashtag, cashtag, bot_command, url, email, phone_number, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs), text_mention (for users without usernames)
	public let type: String

	///Offset in UTF-16 code units to the start of the entity
	public let offset: TelegramInteger

	///Length of the entity in UTF-16 code units
	public let length: TelegramInteger

	///Optional. For “text_link” only, url that will be opened after user taps on the text
	public let url: String?

	///Optional. For “text_mention” only, the mentioned user
	public let user: TelegramUser?

	public init(type: String,
                offset: TelegramInteger,
                length: TelegramInteger,
                url: String? = nil,
                user: TelegramUser? = nil)
	{
		self.type = type
		self.offset = offset
		self.length = length
		self.url = url
		self.user = user
	}

}

extension TelegramMessageEntity: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case offset
		case length
		case url
		case user
	}

}
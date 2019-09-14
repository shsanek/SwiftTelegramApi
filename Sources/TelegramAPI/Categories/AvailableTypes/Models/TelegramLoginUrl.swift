//
//  TelegramLoginUrl.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a parameter of the inline keyboard button used to automatically authorize a user. Serves as a great replacement for the Telegram Login Widget when the user is coming from Telegram. All the user needs to do is tap/click a button and confirm that they want to log in:
public struct TelegramLoginUrl
{

	///An HTTP URL to be opened with user authorization data added to the query string when the button is pressed. If the user refuses to provide authorization data, the original URL without information about the user will be opened. The data added is the same as described in Receiving authorization data.NOTE: You must always check the hash of the received data to verify the authentication and the integrity of the data as described in Checking authorization.
	public let url: String

	///Optional. New text of the button in forwarded messages.
	public let forwardText: String?

	///Optional. Username of a bot, which will be used for user authorization. See Setting up a bot for more details. If not specified, the current bot&#39;s username will be assumed. The url&#39;s domain must be the same as the domain linked with the bot. See Linking your domain to the bot for more details.
	public let botUsername: String?

	///Optional. Pass True to request the permission for your bot to send messages to the user.
	public let requestWriteAccess: Bool?

	public init(url: String,
                forwardText: String? = nil,
                botUsername: String? = nil,
                requestWriteAccess: Bool? = nil)
	{
		self.url = url
		self.forwardText = forwardText
		self.botUsername = botUsername
		self.requestWriteAccess = requestWriteAccess
	}

}

extension TelegramLoginUrl: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case url
		case forwardText = "forward_text"
		case botUsername = "bot_username"
		case requestWriteAccess = "request_write_access"
	}

}

//
//  TelegramForceReply.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply&#39;). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.
public struct TelegramForceReply
{

	///Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply&#39;
	public let forceReply: Bool

	///Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot&#39;s message is a reply (has reply_to_message_id), sender of the original message.
	public let selective: Bool?

	public init(forceReply: Bool,
                selective: Bool? = nil)
	{
		self.forceReply = forceReply
		self.selective = selective
	}

}

extension TelegramForceReply: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case forceReply = "force_reply"
		case selective
	}

}
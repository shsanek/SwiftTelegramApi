//
//  TelegramReplyKeyboardRemove.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup).
public struct TelegramReplyKeyboardRemove
{

	///Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use one_time_keyboard in ReplyKeyboardMarkup)
	public let removeKeyboard: Bool

	///Optional. Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot&#39;s message is a reply (has reply_to_message_id), sender of the original message.Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven&#39;t voted yet.
	public let selective: Bool?

	public init(removeKeyboard: Bool,
                selective: Bool? = nil)
	{
		self.removeKeyboard = removeKeyboard
		self.selective = selective
	}

}

extension TelegramReplyKeyboardRemove: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case removeKeyboard = "remove_keyboard"
		case selective
	}

}

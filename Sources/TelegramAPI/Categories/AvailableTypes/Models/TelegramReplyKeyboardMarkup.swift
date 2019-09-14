//
//  TelegramReplyKeyboardMarkup.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).
public struct TelegramReplyKeyboardMarkup
{

	///Array of button rows, each represented by an Array of KeyboardButton objects
	public let keyboard: [[TelegramKeyboardButton]]

	///Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to false, in which case the custom keyboard is always of the same height as the app&#39;s standard keyboard.
	public let resizeKeyboard: Bool?

	///Optional. Requests clients to hide the keyboard as soon as it&#39;s been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again. Defaults to false.
	public let oneTimeKeyboard: Bool?

	///Optional. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot&#39;s message is a reply (has reply_to_message_id), sender of the original message.Example: A user requests to change the bot‘s language, bot replies to the request with a keyboard to select the new language. Other users in the group don’t see the keyboard.
	public let selective: Bool?

	public init(keyboard: [[TelegramKeyboardButton]],
                resizeKeyboard: Bool? = nil,
                oneTimeKeyboard: Bool? = nil,
                selective: Bool? = nil)
	{
		self.keyboard = keyboard
		self.resizeKeyboard = resizeKeyboard
		self.oneTimeKeyboard = oneTimeKeyboard
		self.selective = selective
	}

}

extension TelegramReplyKeyboardMarkup: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case keyboard
		case resizeKeyboard = "resize_keyboard"
		case oneTimeKeyboard = "one_time_keyboard"
		case selective
	}

}

//
//  TelegramInlineKeyboardButton.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents one button of an inline keyboard. You must use exactly one of the optional fields.
public struct TelegramInlineKeyboardButton
{

	///Label text on the button
	public let text: String

	///Optional. HTTP or tg:// url to be opened when button is pressed
	public let url: String?

	///Optional. An HTTP URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.
	public let loginUrl: TelegramLoginUrl?

	///Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
	public let callbackData: String?

	///Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.Note: This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with switch_pm… actions – in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.
	public let switchInlineQuery: String?

	///Optional. If set, pressing the button will insert the bot‘s username and the specified inline query in the current chat&#39;s input field. Can be empty, in which case only the bot’s username will be inserted.This offers a quick way for the user to open your bot in inline mode in the same chat – good for selecting something from multiple options.
	public let switchInlineQueryCurrentChat: String?

	///Optional. Description of the game that will be launched when the user presses the button.NOTE: This type of button must always be the first button in the first row.
	public let callbackGame: TelegramCallbackGame?

	///Optional. Specify True, to send a Pay button.NOTE: This type of button must always be the first button in the first row.
	public let pay: Bool?

	public init(text: String,
                url: String? = nil,
                loginUrl: TelegramLoginUrl? = nil,
                callbackData: String? = nil,
                switchInlineQuery: String? = nil,
                switchInlineQueryCurrentChat: String? = nil,
                callbackGame: TelegramCallbackGame? = nil,
                pay: Bool? = nil)
	{
		self.text = text
		self.url = url
		self.loginUrl = loginUrl
		self.callbackData = callbackData
		self.switchInlineQuery = switchInlineQuery
		self.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
		self.callbackGame = callbackGame
		self.pay = pay
	}

}

extension TelegramInlineKeyboardButton: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case text
		case url
		case loginUrl = "login_url"
		case callbackData = "callback_data"
		case switchInlineQuery = "switch_inline_query"
		case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
		case callbackGame = "callback_game"
		case pay
	}

}

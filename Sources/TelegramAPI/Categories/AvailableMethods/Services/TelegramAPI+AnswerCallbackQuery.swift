//
//  TelegramAPI+AnswerCallbackQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
	public func answerCallbackQuery(_ input: TelegramAnswerCallbackQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("answerCallbackQuery", object: input, completion: completionHandler)
	}

}


public struct TelegramAnswerCallbackQueryInput
{

	///Unique identifier for the query to be answered
	public let callbackQueryId: String

	///Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
	public let text: String?

	///If true, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
	public let showAlert: Bool?

	///URL that will be opened by the user&#39;s client. If you have created a Game and accepted the conditions via @Botfather, specify the URL that opens your game – note that this will only work if the query comes from a callback_game button.Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
	public let url: String?

	///The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
	public let cacheTime: TelegramInteger?

	public init(callbackQueryId: String,
                text: String? = nil,
                showAlert: Bool? = nil,
                url: String? = nil,
                cacheTime: TelegramInteger? = nil)
	{
		self.callbackQueryId = callbackQueryId
		self.text = text
		self.showAlert = showAlert
		self.url = url
		self.cacheTime = cacheTime
	}

}

extension TelegramAnswerCallbackQueryInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case callbackQueryId = "callback_query_id"
		case text
		case showAlert = "show_alert"
		case url
		case cacheTime = "cache_time"
	}

}


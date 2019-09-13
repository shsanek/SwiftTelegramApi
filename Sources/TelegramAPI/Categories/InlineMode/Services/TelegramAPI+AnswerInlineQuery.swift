//
//  TelegramAPI+AnswerInlineQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed.
	public func answerInlineQuery(_ input: TelegramAnswerInlineQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("answerInlineQuery", object: input, completion: completionHandler)
	}

}


public struct TelegramAnswerInlineQueryInput
{

	///Unique identifier for the answered query
	public let inlineQueryId: String

	///A JSON-serialized array of results for the inline query
	public let results: [TelegramInlineQueryResult]

	///The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
	public let cacheTime: TelegramInteger?

	///Pass True, if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query
	public let isPersonal: Bool?

	///Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don‘t support pagination. Offset length can’t exceed 64 bytes.
	public let nextOffset: String?

	///If passed, clients will display a button with specified text that switches the user to a private chat with the bot and sends the bot a start message with the parameter switch_pm_parameter
	public let switchPmText: String?

	///Deep-linking parameter for the /start message sent to the bot when user presses the switch button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a ‘Connect your YouTube account’ button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an oauth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot&#39;s inline capabilities.
	public let switchPmParameter: String?

	public init(inlineQueryId: String,
                results: [TelegramInlineQueryResult],
                cacheTime: TelegramInteger? = nil,
                isPersonal: Bool? = nil,
                nextOffset: String? = nil,
                switchPmText: String? = nil,
                switchPmParameter: String? = nil)
	{
		self.inlineQueryId = inlineQueryId
		self.results = results
		self.cacheTime = cacheTime
		self.isPersonal = isPersonal
		self.nextOffset = nextOffset
		self.switchPmText = switchPmText
		self.switchPmParameter = switchPmParameter
	}

}

extension TelegramAnswerInlineQueryInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case inlineQueryId = "inline_query_id"
		case results
		case cacheTime = "cache_time"
		case isPersonal = "is_personal"
		case nextOffset = "next_offset"
		case switchPmText = "switch_pm_text"
		case switchPmParameter = "switch_pm_parameter"
	}

}

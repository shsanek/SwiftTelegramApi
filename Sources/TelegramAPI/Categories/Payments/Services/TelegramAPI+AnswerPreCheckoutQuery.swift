//
//  TelegramAPI+AnswerPreCheckoutQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
	public func answerPreCheckoutQuery(_ input: TelegramAnswerPreCheckoutQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("answerPreCheckoutQuery", object: input, completion: completionHandler)
	}

}


public struct TelegramAnswerPreCheckoutQueryInput
{

	///Unique identifier for the query to be answered
	public let preCheckoutQueryId: String

	///Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
	public let ok: Bool

	///Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. &quot;Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!&quot;). Telegram will display this message to the user.
	public let errorMessage: String?

	public init(preCheckoutQueryId: String,
                ok: Bool,
                errorMessage: String? = nil)
	{
		self.preCheckoutQueryId = preCheckoutQueryId
		self.ok = ok
		self.errorMessage = errorMessage
	}

}

extension TelegramAnswerPreCheckoutQueryInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case preCheckoutQueryId = "pre_checkout_query_id"
		case ok
		case errorMessage = "error_message"
	}

}

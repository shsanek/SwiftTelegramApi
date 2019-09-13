//
//  TelegramAPI+AnswerShippingQuery.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned.
	public func answerShippingQuery(_ input: TelegramAnswerShippingQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("answerShippingQuery", object: input, completion: completionHandler)
	}

}


public struct TelegramAnswerShippingQueryInput
{

	///Unique identifier for the query to be answered
	public let shippingQueryId: String

	///Specify True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
	public let ok: Bool

	///Required if ok is True. A JSON-serialized array of available shipping options.
	public let shippingOptions: [TelegramShippingOption]?

	///Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. &quot;Sorry, delivery to your desired address is unavailable&#39;). Telegram will display this message to the user.
	public let errorMessage: String?

	public init(shippingQueryId: String,
                ok: Bool,
                shippingOptions: [TelegramShippingOption]? = nil,
                errorMessage: String? = nil)
	{
		self.shippingQueryId = shippingQueryId
		self.ok = ok
		self.shippingOptions = shippingOptions
		self.errorMessage = errorMessage
	}

}

extension TelegramAnswerShippingQueryInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case shippingQueryId = "shipping_query_id"
		case ok
		case shippingOptions = "shipping_options"
		case errorMessage = "error_message"
	}

}

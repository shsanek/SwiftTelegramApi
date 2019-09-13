//
//  TelegramChosenInlineResult.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a result of an inline query that was chosen by the user and sent to their chat partner.
public struct TelegramChosenInlineResult
{

	///The unique identifier for the result that was chosen
	public let resultId: String

	///The user that chose the result
	public let from: TelegramUser

	///Optional. Sender location, only for bots that require user location
	public let location: TelegramLocation?

	///Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
	public let inlineMessageId: String?

	///The query that was used to obtain the result
	public let query: String

	public init(resultId: String,
                from: TelegramUser,
                location: TelegramLocation? = nil,
                inlineMessageId: String? = nil,
                query: String)
	{
		self.resultId = resultId
		self.from = from
		self.location = location
		self.inlineMessageId = inlineMessageId
		self.query = query
	}

}

extension TelegramChosenInlineResult: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case resultId = "result_id"
		case from
		case location
		case inlineMessageId = "inline_message_id"
		case query
	}

}
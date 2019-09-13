//
//  TelegramAPI+StopPoll.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to stop a poll which was sent by the bot. On success, the stopped Poll with the final results is returned.
	public func stopPoll(_ input: TelegramStopPollInput, completionHandler: @escaping (TelegramResult<TelegramPoll>) -> Void)
	{
		self.requester.request("stopPoll", object: input, completion: completionHandler)
	}

}


public struct TelegramStopPollInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Identifier of the original message with the poll
	public let messageId: TelegramInteger

	///A JSON-serialized object for a new message inline keyboard.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramIdentifierContainer,
                messageId: TelegramInteger,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramStopPollInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case replyMarkup = "reply_markup"
	}

}

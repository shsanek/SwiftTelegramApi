//
//  TelegramAPI+GetGameHighScores.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to get data for high score tables. Will return the score of the specified user and several of his neighbors in a game. On success, returns an Array of GameHighScore objects.
	public func getGameHighScores(_ input: TelegramGetGameHighScoresInput, completionHandler: @escaping (TelegramResult<[TelegramGameHighScore]>) -> Void)
	{
		self.requester.request("getGameHighScores", object: input, completion: completionHandler)
	}

}


public struct TelegramGetGameHighScoresInput
{

	///Target user id
	public let userId: TelegramInteger

	///Required if inline_message_id is not specified. Unique identifier for the target chat
	public let chatId: TelegramInteger?

	///Required if inline_message_id is not specified. Identifier of the sent message
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	public init(userId: TelegramInteger,
                chatId: TelegramInteger? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil)
	{
		self.userId = userId
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
	}

}

extension TelegramGetGameHighScoresInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
	}

}

//
//  TelegramAPI+SetGameScore.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to set the score of the specified user in a game. On success, if the message was sent by the bot, returns the edited Message, otherwise returns True. Returns an error, if the new score is not greater than the user&#39;s current score in the chat and force is False.
	public func setGameScore(_ input: TelegramSetGameScoreInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setGameScore", object: input, completion: completionHandler)
	}

}


public struct TelegramSetGameScoreInput
{

	///User identifier
	public let userId: TelegramInteger

	///New score, must be non-negative
	public let score: TelegramInteger

	///Pass True, if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
	public let force: Bool?

	///Pass True, if the game message should not be automatically edited to include the current scoreboard
	public let disableEditMessage: Bool?

	///Required if inline_message_id is not specified. Unique identifier for the target chat
	public let chatId: TelegramInteger?

	///Required if inline_message_id is not specified. Identifier of the sent message
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	public init(userId: TelegramInteger,
                score: TelegramInteger,
                force: Bool? = nil,
                disableEditMessage: Bool? = nil,
                chatId: TelegramInteger? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil)
	{
		self.userId = userId
		self.score = score
		self.force = force
		self.disableEditMessage = disableEditMessage
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
	}

}

extension TelegramSetGameScoreInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case score
		case force
		case disableEditMessage = "disable_edit_message"
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
	}

}

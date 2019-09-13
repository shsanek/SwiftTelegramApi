//
//  TelegramAPI+SendPoll.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send a native poll. A native poll can&#39;t be sent to a private chat. On success, the sent Message is returned.
	public func sendPoll(_ input: TelegramSendPollInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendPoll", object: input, completion: completionHandler)
	}

}


public struct TelegramSendPollInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername). A native poll can&#39;t be sent to a private chat.
	public let chatId: TelegramIdentifierContainer

	///Poll question, 1-255 characters
	public let question: String

	///List of answer options, 2-10 strings 1-100 characters each
	public let options: [String]

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                question: String,
                options: [String],
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.question = question
		self.options = options
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendPollInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case question
		case options
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

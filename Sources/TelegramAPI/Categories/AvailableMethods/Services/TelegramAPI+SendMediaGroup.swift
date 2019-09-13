//
//  TelegramAPI+SendMediaGroup.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to send a group of photos or videos as an album. On success, an array of the sent Messages is returned.
	public func sendMediaGroup(_ input: TelegramSendMediaGroupInput, completionHandler: @escaping (TelegramResult<[TelegramMessage]>) -> Void)
	{
		self.requester.request("sendMediaGroup", object: input, completion: completionHandler)
	}

}


public struct TelegramSendMediaGroupInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///A JSON-serialized array describing photos and videos to be sent, must include 2–10 items
	public let media: [TelegramInputMediaContainer]

	///Sends the messages silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the messages are a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	public init(chatId: TelegramIdentifierContainer,
                media: [TelegramInputMediaContainer],
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil)
	{
		self.chatId = chatId
		self.media = media
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
	}

}

extension TelegramSendMediaGroupInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case media
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
	}

}

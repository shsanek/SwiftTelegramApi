//
//  TelegramAPI+SendChatAction.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method when you need to tell the user that something is happening on the bot&#39;s side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
	public func sendChatAction(_ input: TelegramSendChatActionInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("sendChatAction", object: input, completion: completionHandler)
	}

}


public struct TelegramSendChatActionInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_audio or upload_audio for audio files, upload_document for general files, find_location for location data, record_video_note or upload_video_note for video notes.
	public let action: String

	public init(chatId: TelegramIdentifierContainer,
                action: String)
	{
		self.chatId = chatId
		self.action = action
	}

}

extension TelegramSendChatActionInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case action
	}

}

//
//  TelegramAPI+SendVoice.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .ogg file encoded with OPUS (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future.
	public func sendVoice(_ input: TelegramSendVoiceInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendVoice", object: input, completion: completionHandler)
	}

}


public struct TelegramSendVoiceInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Audio file to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	public let voice: TelegramInputFileContainer

	///Voice message caption, 0-1024 characters
	public let caption: String?

	///Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Duration of the voice message in seconds
	public let duration: TelegramInteger?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                voice: TelegramInputFileContainer,
                caption: String? = nil,
                parseMode: String? = nil,
                duration: TelegramInteger? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.voice = voice
		self.caption = caption
		self.parseMode = parseMode
		self.duration = duration
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendVoiceInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case voice
		case caption
		case parseMode = "parse_mode"
		case duration
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

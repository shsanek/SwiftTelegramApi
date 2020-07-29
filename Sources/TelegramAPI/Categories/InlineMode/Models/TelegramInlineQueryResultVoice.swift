//
//  TelegramInlineQueryResultVoice.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a voice recording in an .ogg container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.
public struct TelegramInlineQueryResultVoice: TelegramInlineQueryResult
{

	///Type of the result, must be voice
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid URL for the voice recording
	public let voiceUrl: String

	///Recording title
	public let title: String

	///Optional. Caption, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Recording duration in seconds
	public let voiceDuration: TelegramInteger?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the voice recording
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                voiceUrl: String,
                title: String,
                caption: String? = nil,
                parseMode: String? = nil,
                voiceDuration: TelegramInteger? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.voiceUrl = voiceUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.voiceDuration = voiceDuration
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultVoice: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case voiceUrl = "voice_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case voiceDuration = "voice_duration"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}

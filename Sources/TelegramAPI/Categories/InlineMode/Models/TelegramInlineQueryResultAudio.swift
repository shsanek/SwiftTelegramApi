//
//  TelegramInlineQueryResultAudio.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to an mp3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
public struct TelegramInlineQueryResultAudio
{

	///Type of the result, must be audio
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid URL for the audio file
	public let audioUrl: String

	///Title
	public let title: String

	///Optional. Caption, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Performer
	public let performer: String?

	///Optional. Audio duration in seconds
	public let audioDuration: TelegramInteger?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the audio
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                audioUrl: String,
                title: String,
                caption: String? = nil,
                parseMode: String? = nil,
                performer: String? = nil,
                audioDuration: TelegramInteger? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.audioUrl = audioUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.performer = performer
		self.audioDuration = audioDuration
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultAudio: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case audioUrl = "audio_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case performer
		case audioDuration = "audio_duration"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}
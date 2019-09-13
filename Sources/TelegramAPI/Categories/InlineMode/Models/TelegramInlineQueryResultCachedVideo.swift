//
//  TelegramInlineQueryResultCachedVideo.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
public struct TelegramInlineQueryResultCachedVideo
{

	///Type of the result, must be video
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid file identifier for the video file
	public let videoFileId: String

	///Title for the result
	public let title: String

	///Optional. Short description of the result
	public let description: String?

	///Optional. Caption of the video to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the video
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                videoFileId: String,
                title: String,
                description: String? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.videoFileId = videoFileId
		self.title = title
		self.description = description
		self.caption = caption
		self.parseMode = parseMode
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultCachedVideo: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case videoFileId = "video_file_id"
		case title
		case description
		case caption
		case parseMode = "parse_mode"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}
//
//  TelegramInlineQueryResultVideo.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
public struct TelegramInlineQueryResultVideo: TelegramInlineQueryResult
{

	///Type of the result, must be video
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid URL for the embedded video player or video file
	public let videoUrl: String

	///Mime type of the content of video url, “text/html” or “video/mp4”
	public let mimeType: String

	///URL of the thumbnail (jpeg only) for the video
	public let thumbUrl: String

	///Title for the result
	public let title: String

	///Optional. Caption of the video to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Optional. Video width
	public let videoWidth: TelegramInteger?

	///Optional. Video height
	public let videoHeight: TelegramInteger?

	///Optional. Video duration in seconds
	public let videoDuration: TelegramInteger?

	///Optional. Short description of the result
	public let description: String?

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                videoUrl: String,
                mimeType: String,
                thumbUrl: String,
                title: String,
                caption: String? = nil,
                parseMode: String? = nil,
                videoWidth: TelegramInteger? = nil,
                videoHeight: TelegramInteger? = nil,
                videoDuration: TelegramInteger? = nil,
                description: String? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.videoUrl = videoUrl
		self.mimeType = mimeType
		self.thumbUrl = thumbUrl
		self.title = title
		self.caption = caption
		self.parseMode = parseMode
		self.videoWidth = videoWidth
		self.videoHeight = videoHeight
		self.videoDuration = videoDuration
		self.description = description
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultVideo: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case videoUrl = "video_url"
		case mimeType = "mime_type"
		case thumbUrl = "thumb_url"
		case title
		case caption
		case parseMode = "parse_mode"
		case videoWidth = "video_width"
		case videoHeight = "video_height"
		case videoDuration = "video_duration"
		case description
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}

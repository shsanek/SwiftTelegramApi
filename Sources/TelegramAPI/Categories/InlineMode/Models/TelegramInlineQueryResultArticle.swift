//
//  TelegramInlineQueryResultArticle.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to an article or web page.
public struct TelegramInlineQueryResultArticle
{

	///Type of the result, must be article
	public let type: String

	///Unique identifier for this result, 1-64 Bytes
	public let id: String

	///Title of the result
	public let title: String

	///Content of the message to be sent
	public let inputMessageContent: TelegramInputMessageContent

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. URL of the result
	public let url: String?

	///Optional. Pass True, if you don&#39;t want the URL to be shown in the message
	public let hideUrl: Bool?

	///Optional. Short description of the result
	public let description: String?

	///Optional. Url of the thumbnail for the result
	public let thumbUrl: String?

	///Optional. Thumbnail width
	public let thumbWidth: TelegramInteger?

	///Optional. Thumbnail height
	public let thumbHeight: TelegramInteger?

	public init(type: String,
                id: String,
                title: String,
                inputMessageContent: TelegramInputMessageContent,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                url: String? = nil,
                hideUrl: Bool? = nil,
                description: String? = nil,
                thumbUrl: String? = nil,
                thumbWidth: TelegramInteger? = nil,
                thumbHeight: TelegramInteger? = nil)
	{
		self.type = type
		self.id = id
		self.title = title
		self.inputMessageContent = inputMessageContent
		self.replyMarkup = replyMarkup
		self.url = url
		self.hideUrl = hideUrl
		self.description = description
		self.thumbUrl = thumbUrl
		self.thumbWidth = thumbWidth
		self.thumbHeight = thumbHeight
	}

}

extension TelegramInlineQueryResultArticle: TelegramInlineQueryResult
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case title
		case inputMessageContent = "input_message_content"
		case replyMarkup = "reply_markup"
		case url
		case hideUrl = "hide_url"
		case description
		case thumbUrl = "thumb_url"
		case thumbWidth = "thumb_width"
		case thumbHeight = "thumb_height"
	}

}

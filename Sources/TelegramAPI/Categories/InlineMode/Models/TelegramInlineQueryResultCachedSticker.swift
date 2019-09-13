//
//  TelegramInlineQueryResultCachedSticker.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker.
public struct TelegramInlineQueryResultCachedSticker
{

	///Type of the result, must be sticker
	public let type: String

	///Unique identifier for this result, 1-64 bytes
	public let id: String

	///A valid file identifier of the sticker
	public let stickerFileId: String

	///Optional. Inline keyboard attached to the message
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	///Optional. Content of the message to be sent instead of the sticker
	public let inputMessageContent: TelegramInputMessageContent?

	public init(type: String,
                id: String,
                stickerFileId: String,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil,
                inputMessageContent: TelegramInputMessageContent? = nil)
	{
		self.type = type
		self.id = id
		self.stickerFileId = stickerFileId
		self.replyMarkup = replyMarkup
		self.inputMessageContent = inputMessageContent
	}

}

extension TelegramInlineQueryResultCachedSticker: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case id
		case stickerFileId = "sticker_file_id"
		case replyMarkup = "reply_markup"
		case inputMessageContent = "input_message_content"
	}

}
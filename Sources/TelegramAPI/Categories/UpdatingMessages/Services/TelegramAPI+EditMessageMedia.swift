//
//  TelegramAPI+EditMessageMedia.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to edit animation, audio, document, photo, or video messages. If a message is a part of a message album, then it can be edited only to a photo or a video. Otherwise, message type can be changed arbitrarily. When inline message is edited, new file can&#39;t be uploaded. Use previously uploaded file via its file_id or specify a URL. On success, if the edited message was sent by the bot, the edited Message is returned, otherwise True is returned.
	public func editMessageMedia(_ input: TelegramEditMessageMediaInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("editMessageMedia", object: input, completion: completionHandler)
	}

}


public struct TelegramEditMessageMediaInput
{

	///Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer?

	///Required if inline_message_id is not specified. Identifier of the message to edit
	public let messageId: TelegramInteger?

	///Required if chat_id and message_id are not specified. Identifier of the inline message
	public let inlineMessageId: String?

	///A JSON-serialized object for a new media content of the message
	public let media: TelegramInputMedia

	///A JSON-serialized object for a new inline keyboard.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramIdentifierContainer? = nil,
                messageId: TelegramInteger? = nil,
                inlineMessageId: String? = nil,
                media: TelegramInputMedia,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.messageId = messageId
		self.inlineMessageId = inlineMessageId
		self.media = media
		self.replyMarkup = replyMarkup
	}

}

extension TelegramEditMessageMediaInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case messageId = "message_id"
		case inlineMessageId = "inline_message_id"
		case media
		case replyMarkup = "reply_markup"
	}

}

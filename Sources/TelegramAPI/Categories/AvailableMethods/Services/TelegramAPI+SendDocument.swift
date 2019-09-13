//
//  TelegramAPI+SendDocument.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.
	public func sendDocument(_ input: TelegramSendDocumentInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendDocument", object: input, completion: completionHandler)
	}

}


public struct TelegramSendDocumentInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///File to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	public let document: TelegramInputFileContainer

	///Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
	public let thumb: TelegramInputFileContainer?

	///Document caption (may also be used when resending documents by file_id), 0-1024 characters
	public let caption: String?

	///Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                document: TelegramInputFileContainer,
                thumb: TelegramInputFileContainer? = nil,
                caption: String? = nil,
                parseMode: String? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.document = document
		self.thumb = thumb
		self.caption = caption
		self.parseMode = parseMode
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendDocumentInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case document
		case thumb
		case caption
		case parseMode = "parse_mode"
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

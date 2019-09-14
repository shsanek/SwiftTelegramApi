//
//  TelegramAPI+SendSticker.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send static .WEBP or animated .TGS stickers. On success, the sent Message is returned.
	public func sendSticker(_ input: TelegramSendStickerInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendSticker", object: input, completion: completionHandler)
	}

}


public struct TelegramSendStickerInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Sticker to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .webp file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	public let sticker: TelegramInputFileContainer

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                sticker: TelegramInputFileContainer,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.sticker = sticker
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}


extension TelegramSendStickerInput: IMultiPartFromDataEncodable
{

	internal func encode(_ encoder: MultiPartFromDataEncoder)
	{
		encoder.append("chat_id", object: self.chatId)
		encoder.append("sticker", object: self.sticker)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("reply_markup", object: self.replyMarkup)
	}

}


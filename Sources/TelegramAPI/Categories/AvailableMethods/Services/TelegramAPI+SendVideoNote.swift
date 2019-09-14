//
//  TelegramAPI+SendVideoNote.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// As of v.4.0, Telegram clients support rounded square mp4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned.
	public func sendVideoNote(_ input: TelegramSendVideoNoteInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendVideoNote", object: input, completion: completionHandler)
	}

}


public struct TelegramSendVideoNoteInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Video note to send. Pass a file_id as String to send a video note that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More info on Sending Files ». Sending video notes by a URL is currently unsupported
	public let videoNote: TelegramInputFileContainer

	///Duration of sent video in seconds
	public let duration: TelegramInteger?

	///Video width and height, i.e. diameter of the video message
	public let length: TelegramInteger?

	///Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
	public let thumb: TelegramInputFileContainer?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                videoNote: TelegramInputFileContainer,
                duration: TelegramInteger? = nil,
                length: TelegramInteger? = nil,
                thumb: TelegramInputFileContainer? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.videoNote = videoNote
		self.duration = duration
		self.length = length
		self.thumb = thumb
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}


extension TelegramSendVideoNoteInput: IMultiPartFromDataEncodable
{

	internal func encode(_ encoder: MultiPartFromDataEncoder)
	{
		encoder.append("chat_id", object: self.chatId)
		encoder.append("video_note", object: self.videoNote)
		encoder.append("duration", object: self.duration)
		encoder.append("length", object: self.length)
		encoder.append("thumb", object: self.thumb)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("reply_markup", object: self.replyMarkup)
	}

}


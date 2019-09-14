//
//  TelegramAPI+SendAudio.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .mp3 format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.For sending voice messages, use the sendVoice method instead.
	public func sendAudio(_ input: TelegramSendAudioInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendAudio", object: input, completion: completionHandler)
	}

}


public struct TelegramSendAudioInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Audio file to send. Pass a file_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	public let audio: TelegramInputFileContainer

	///Audio caption, 0-1024 characters
	public let caption: String?

	///Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	///Duration of the audio in seconds
	public let duration: TelegramInteger?

	///Performer
	public let performer: String?

	///Track name
	public let title: String?

	///Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
	public let thumb: TelegramInputFileContainer?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                audio: TelegramInputFileContainer,
                caption: String? = nil,
                parseMode: String? = nil,
                duration: TelegramInteger? = nil,
                performer: String? = nil,
                title: String? = nil,
                thumb: TelegramInputFileContainer? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.audio = audio
		self.caption = caption
		self.parseMode = parseMode
		self.duration = duration
		self.performer = performer
		self.title = title
		self.thumb = thumb
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}


extension TelegramSendAudioInput: IMultiPartFromDataEncodable
{

	internal func encode(_ encoder: MultiPartFromDataEncoder)
	{
		encoder.append("chat_id", object: self.chatId)
		encoder.append("audio", object: self.audio)
		encoder.append("caption", object: self.caption)
		encoder.append("parse_mode", object: self.parseMode)
		encoder.append("duration", object: self.duration)
		encoder.append("performer", object: self.performer)
		encoder.append("title", object: self.title)
		encoder.append("thumb", object: self.thumb)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("reply_markup", object: self.replyMarkup)
	}

}


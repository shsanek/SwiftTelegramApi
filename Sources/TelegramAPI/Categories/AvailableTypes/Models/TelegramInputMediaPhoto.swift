//
//  TelegramInputMediaPhoto.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a photo to be sent.
public struct TelegramInputMediaPhoto
{

	///Type of the result, must be photo
	public let type: String

	///File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
	public let media: String

	///Optional. Caption of the photo to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	public init(type: String,
                media: String,
                caption: String? = nil,
                parseMode: String? = nil)
	{
		self.type = type
		self.media = media
		self.caption = caption
		self.parseMode = parseMode
	}

}

extension TelegramInputMediaPhoto: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case media
		case caption
		case parseMode = "parse_mode"
	}

}
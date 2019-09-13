//
//  TelegramInputMediaDocument.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Represents a general file to be sent.
public struct TelegramInputMediaDocument
{

	///Type of the result, must be document
	public let type: String

	///File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://&lt;file_attach_name&gt;” to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files »
	public let media: String

	///Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://&lt;file_attach_name&gt;” if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files »
	public let thumb: TelegramInputFileContainer?

	///Optional. Caption of the document to be sent, 0-1024 characters
	public let caption: String?

	///Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
	public let parseMode: String?

	public init(type: String,
                media: String,
                thumb: TelegramInputFileContainer? = nil,
                caption: String? = nil,
                parseMode: String? = nil)
	{
		self.type = type
		self.media = media
		self.thumb = thumb
		self.caption = caption
		self.parseMode = parseMode
	}

}

extension TelegramInputMediaDocument: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case type
		case media
		case thumb
		case caption
		case parseMode = "parse_mode"
	}

}
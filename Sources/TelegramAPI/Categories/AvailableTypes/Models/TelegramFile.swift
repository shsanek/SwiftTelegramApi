//
//  TelegramFile.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot&lt;token&gt;/&lt;file_path&gt;. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.
public struct TelegramFile
{

	///Identifier for this file
	public let fileId: String

	///Optional. File size, if known
	public let fileSize: TelegramInteger?

	///Optional. File path. Use https://api.telegram.org/file/bot&lt;token&gt;/&lt;file_path&gt; to get the file.
	public let filePath: String?

	public init(fileId: String,
                fileSize: TelegramInteger? = nil,
                filePath: String? = nil)
	{
		self.fileId = fileId
		self.fileSize = fileSize
		self.filePath = filePath
	}

}

extension TelegramFile: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case fileId = "file_id"
		case fileSize = "file_size"
		case filePath = "file_path"
	}

}

//
//  TelegramChatPhoto.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents a chat photo.
public struct TelegramChatPhoto
{

	///File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
	public let smallFileId: String

	///File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
	public let bigFileId: String

	public init(smallFileId: String,
                bigFileId: String)
	{
		self.smallFileId = smallFileId
		self.bigFileId = bigFileId
	}

}

extension TelegramChatPhoto: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case smallFileId = "small_file_id"
		case bigFileId = "big_file_id"
	}

}

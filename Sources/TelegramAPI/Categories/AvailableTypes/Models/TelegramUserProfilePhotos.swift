//
//  TelegramUserProfilePhotos.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represent a user&#39;s profile pictures.
public struct TelegramUserProfilePhotos
{

	///Total number of profile pictures the target user has
	public let totalCount: TelegramInteger

	///Requested profile pictures (in up to 4 sizes each)
	public let photos: [[TelegramPhotoSize]]

	public init(totalCount: TelegramInteger,
                photos: [[TelegramPhotoSize]])
	{
		self.totalCount = totalCount
		self.photos = photos
	}

}

extension TelegramUserProfilePhotos: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case totalCount = "total_count"
		case photos
	}

}

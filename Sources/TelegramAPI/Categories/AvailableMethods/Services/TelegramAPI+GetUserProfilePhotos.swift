//
//  TelegramAPI+GetUserProfilePhotos.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
	public func getUserProfilePhotos(_ input: TelegramGetUserProfilePhotosInput, completionHandler: @escaping (TelegramResult<TelegramUserProfilePhotos>) -> Void)
	{
		self.requester.request("getUserProfilePhotos", object: input, completion: completionHandler)
	}

}


public struct TelegramGetUserProfilePhotosInput
{

	///Unique identifier of the target user
	public let userId: TelegramInteger

	///Sequential number of the first photo to be returned. By default, all photos are returned.
	public let offset: TelegramInteger?

	///Limits the number of photos to be retrieved. Values between 1—100 are accepted. Defaults to 100.
	public let limit: TelegramInteger?

	public init(userId: TelegramInteger,
                offset: TelegramInteger? = nil,
                limit: TelegramInteger? = nil)
	{
		self.userId = userId
		self.offset = offset
		self.limit = limit
	}

}

extension TelegramGetUserProfilePhotosInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case userId = "user_id"
		case offset
		case limit
	}

}


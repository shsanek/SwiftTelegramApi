//
//  TelegramResponseParameters.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Contains information about why a request was unsuccessful.
public struct TelegramResponseParameters
{

	///Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	public let migrateToChatId: TelegramInteger?

	///Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
	public let retryAfter: TelegramInteger?

	public init(migrateToChatId: TelegramInteger? = nil,
                retryAfter: TelegramInteger? = nil)
	{
		self.migrateToChatId = migrateToChatId
		self.retryAfter = retryAfter
	}

}

extension TelegramResponseParameters: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case migrateToChatId = "migrate_to_chat_id"
		case retryAfter = "retry_after"
	}

}
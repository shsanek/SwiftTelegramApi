//
//  TelegramAPI+GetUpdates.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to receive incoming updates using long polling (wiki). An Array of Update objects is returned.
	public func getUpdates(_ input: TelegramGetUpdatesInput, completionHandler: @escaping (TelegramResult<[TelegramUpdate]>) -> Void)
	{
		self.requester.request("getUpdates", object: input, completion: completionHandler)
	}

}


public struct TelegramGetUpdatesInput
{

	///Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will forgotten.
	public let offset: TelegramInteger?

	///Limits the number of updates to be retrieved. Values between 1—100 are accepted. Defaults to 100.
	public let limit: TelegramInteger?

	///Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
	public let timeout: TelegramInteger?

	///List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.Please note that this parameter doesn&#39;t affect updates created before the call to the getUpdates, so unwanted updates may be received for a short period of time.
	public let allowedUpdates: [String]?

	public init(offset: TelegramInteger? = nil,
                limit: TelegramInteger? = nil,
                timeout: TelegramInteger? = nil,
                allowedUpdates: [String]? = nil)
	{
		self.offset = offset
		self.limit = limit
		self.timeout = timeout
		self.allowedUpdates = allowedUpdates
	}

}

extension TelegramGetUpdatesInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case offset
		case limit
		case timeout
		case allowedUpdates = "allowed_updates"
	}

}


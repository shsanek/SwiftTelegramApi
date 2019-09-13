//
//  TelegramAPI+SendLocation.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to send point on the map. On success, the sent Message is returned.
	public func sendLocation(_ input: TelegramSendLocationInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendLocation", object: input, completion: completionHandler)
	}

}


public struct TelegramSendLocationInput
{

	///Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	///Latitude of the location
	public let latitude: TelegramFloat

	///Longitude of the location
	public let longitude: TelegramFloat

	///Period in seconds for which the location will be updated (see Live Locations, should be between 60 and 86400.
	public let livePeriod: TelegramInteger?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(chatId: TelegramIdentifierContainer,
                latitude: TelegramFloat,
                longitude: TelegramFloat,
                livePeriod: TelegramInteger? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramMarkupContainer? = nil)
	{
		self.chatId = chatId
		self.latitude = latitude
		self.longitude = longitude
		self.livePeriod = livePeriod
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendLocationInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case latitude
		case longitude
		case livePeriod = "live_period"
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

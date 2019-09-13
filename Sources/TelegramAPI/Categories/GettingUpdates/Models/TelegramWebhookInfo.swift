//
//  TelegramWebhookInfo.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///Contains information about the current status of a webhook.
public struct TelegramWebhookInfo
{

	///Webhook URL, may be empty if webhook is not set up
	public let url: String

	///True, if a custom certificate was provided for webhook certificate checks
	public let hasCustomCertificate: Bool

	///Number of updates awaiting delivery
	public let pendingUpdateCount: TelegramInteger

	///Optional. Unix time for the most recent error that happened when trying to deliver an update via webhook
	public let lastErrorDate: TelegramInteger?

	///Optional. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
	public let lastErrorMessage: String?

	///Optional. Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
	public let maxConnections: TelegramInteger?

	///Optional. A list of update types the bot is subscribed to. Defaults to all update types
	public let allowedUpdates: [String]?

	public init(url: String,
                hasCustomCertificate: Bool,
                pendingUpdateCount: TelegramInteger,
                lastErrorDate: TelegramInteger? = nil,
                lastErrorMessage: String? = nil,
                maxConnections: TelegramInteger? = nil,
                allowedUpdates: [String]? = nil)
	{
		self.url = url
		self.hasCustomCertificate = hasCustomCertificate
		self.pendingUpdateCount = pendingUpdateCount
		self.lastErrorDate = lastErrorDate
		self.lastErrorMessage = lastErrorMessage
		self.maxConnections = maxConnections
		self.allowedUpdates = allowedUpdates
	}

}

extension TelegramWebhookInfo: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case url
		case hasCustomCertificate = "has_custom_certificate"
		case pendingUpdateCount = "pending_update_count"
		case lastErrorDate = "last_error_date"
		case lastErrorMessage = "last_error_message"
		case maxConnections = "max_connections"
		case allowedUpdates = "allowed_updates"
	}

}
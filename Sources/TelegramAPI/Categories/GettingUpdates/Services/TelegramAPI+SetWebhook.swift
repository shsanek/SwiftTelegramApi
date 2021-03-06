//
//  TelegramAPI+SetWebhook.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

	/// Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns True on success.If you&#39;d like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. https://www.example.com/&lt;token&gt;. Since nobody else knows your bot‘s token, you can be pretty sure it’s us.
	public func setWebhook(_ input: TelegramSetWebhookInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void)
	{
		self.requester.request("setWebhook", object: input, completion: completionHandler)
	}

}


public struct TelegramSetWebhookInput
{

	///HTTPS url to send updates to. Use an empty string to remove webhook integration
	public let url: String

	///Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
	public let certificate: TelegramInputFile?

	///Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot‘s server, and higher values to increase your bot’s throughput.
	public let maxConnections: TelegramInteger?

	///List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.Please note that this parameter doesn&#39;t affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
	public let allowedUpdates: [String]?

	public init(url: String,
                certificate: TelegramInputFile? = nil,
                maxConnections: TelegramInteger? = nil,
                allowedUpdates: [String]? = nil)
	{
		self.url = url
		self.certificate = certificate
		self.maxConnections = maxConnections
		self.allowedUpdates = allowedUpdates
	}

}


extension TelegramSetWebhookInput: IMultiPartFromDataEncodable
{

	internal func encode(_ encoder: MultiPartFromDataEncoder)
	{
		encoder.append("url", object: self.url)
		encoder.append("@certificate", object: self.certificate)
		encoder.append("max_connections", object: self.maxConnections)
		encoder.append("allowed_updates", object: self.allowedUpdates)
	}

}


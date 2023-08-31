extension TelegramAPI {
    /// Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns True on success.
    public func setWebhook(_ input: SetWebhookInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setWebhook", object: input, completion: completionHandler)
    }
}

//Input model for request setWebhook
public final class SetWebhookInput: IMultiPartFromDataEncodable {
	///Yes. HTTPS URL to send updates to. Use an empty string to remove webhook integration
	public let url: String
	
	///Optional. Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
	public let certificate: TelegramInputFile?
	
	///Optional. The fixed IP address which will be used to send webhook requests instead of the IP address resolved through DNS
	public let ipAddress: String?
	
	///Optional. The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot's server, and higher values to increase your bot's throughput.
	public let maxConnections: TelegramInteger?
	
	///Optional. A JSON-serialized list of the update types you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
	public let allowedUpdates: [String]?
	
	///Optional. Pass True to drop all pending updates
	public let dropPendingUpdates: Bool?
	
	///Optional. A secret token to be sent in a header “X-Telegram-Bot-Api-Secret-Token” in every webhook request, 1-256 characters. Only characters A-Z, a-z, 0-9, _ and - are allowed. The header is useful to ensure that the request comes from a webhook set by you.
	public let secretToken: String?

	public init(
		url: String,
		certificate: TelegramInputFile? = nil,
		ipAddress: String? = nil,
		maxConnections: TelegramInteger? = nil,
		allowedUpdates: [String]? = nil,
		dropPendingUpdates: Bool? = nil,
		secretToken: String? = nil
	) {
		self.url = url
		self.certificate = certificate
		self.ipAddress = ipAddress
		self.maxConnections = maxConnections
		self.allowedUpdates = allowedUpdates
		self.dropPendingUpdates = dropPendingUpdates
		self.secretToken = secretToken
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("url", object: self.url)
		encoder.append("certificate", object: self.certificate)
		encoder.append("ip_address", object: self.ipAddress)
		encoder.append("max_connections", object: self.maxConnections)
		encoder.append("allowed_updates", object: self.allowedUpdates)
		encoder.append("drop_pending_updates", object: self.dropPendingUpdates)
		encoder.append("secret_token", object: self.secretToken)
	}
}
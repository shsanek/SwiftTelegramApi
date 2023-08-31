extension TelegramAPI {
    /// Use this method to specify a URL and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified URL, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns True on success.
    public func setWebhook(_ input: SetWebhookInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setWebhook", object: input, completion: completionHandler)
    }
}

//Input model for request setWebhook
public final class SetWebhookInput: IMultiPartFromDataEncodable {
	///Yes
	public let url: String
	
	///Optional
	public let certificate: TelegramInputFile
	
	///Optional
	public let ipAddress: String
	
	///Optional
	public let maxConnections: TelegramInteger
	
	///Optional
	public let allowedUpdates: [String]
	
	///Optional
	public let dropPendingUpdates: Bool
	
	///Optional
	public let secretToken: String

	public init(
		url: String,
		certificate: TelegramInputFile,
		ipAddress: String,
		maxConnections: TelegramInteger,
		allowedUpdates: [String],
		dropPendingUpdates: Bool,
		secretToken: String
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
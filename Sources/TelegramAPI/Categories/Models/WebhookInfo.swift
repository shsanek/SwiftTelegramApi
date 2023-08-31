public final class WebhookInfo: Codable, IMultiPartFromDataEncodable {
	///Webhook URL, may be empty if webhook is not set up
	public let url: String
	
	///True, if a custom certificate was provided for webhook certificate checks
	public let hasCustomCertificate: Bool
	
	///Number of updates awaiting delivery
	public let pendingUpdateCount: TelegramInteger
	
	///Optional. Currently used webhook IP address
	public let ipAddress: String?
	
	///Optional. Unix time for the most recent error that happened when trying to deliver an update via webhook
	public let lastErrorDate: TelegramInteger?
	
	///Optional. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
	public let lastErrorMessage: String?
	
	///Optional. Unix time of the most recent error that happened when trying to synchronize available updates with Telegram datacenters
	public let lastSynchronizationErrorDate: TelegramInteger?
	
	///Optional. The maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
	public let maxConnections: TelegramInteger?
	
	///Optional. A list of update types the bot is subscribed to. Defaults to all update types except chat_member
	public let allowedUpdates: [String]?

	public init(
		url: String,
		hasCustomCertificate: Bool,
		pendingUpdateCount: TelegramInteger,
		ipAddress: String? = nil,
		lastErrorDate: TelegramInteger? = nil,
		lastErrorMessage: String? = nil,
		lastSynchronizationErrorDate: TelegramInteger? = nil,
		maxConnections: TelegramInteger? = nil,
		allowedUpdates: [String]? = nil
	) {
		self.url = url
		self.hasCustomCertificate = hasCustomCertificate
		self.pendingUpdateCount = pendingUpdateCount
		self.ipAddress = ipAddress
		self.lastErrorDate = lastErrorDate
		self.lastErrorMessage = lastErrorMessage
		self.lastSynchronizationErrorDate = lastSynchronizationErrorDate
		self.maxConnections = maxConnections
		self.allowedUpdates = allowedUpdates
	}

	private enum CodingKeys: String, CodingKey {
		case url
		case hasCustomCertificate = "has_custom_certificate"
		case pendingUpdateCount = "pending_update_count"
		case ipAddress = "ip_address"
		case lastErrorDate = "last_error_date"
		case lastErrorMessage = "last_error_message"
		case lastSynchronizationErrorDate = "last_synchronization_error_date"
		case maxConnections = "max_connections"
		case allowedUpdates = "allowed_updates"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.url.self, forKey: .url)
		try container.encode(self.hasCustomCertificate.self, forKey: .hasCustomCertificate)
		try container.encode(self.pendingUpdateCount.self, forKey: .pendingUpdateCount)
		try container.encodeIfPresent(self.ipAddress.self, forKey: .ipAddress)
		try container.encodeIfPresent(self.lastErrorDate.self, forKey: .lastErrorDate)
		try container.encodeIfPresent(self.lastErrorMessage.self, forKey: .lastErrorMessage)
		try container.encodeIfPresent(self.lastSynchronizationErrorDate.self, forKey: .lastSynchronizationErrorDate)
		try container.encodeIfPresent(self.maxConnections.self, forKey: .maxConnections)
		try container.encodeIfPresent(self.allowedUpdates.self, forKey: .allowedUpdates)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.url = try container.decode(String.self, forKey: .url)
		self.hasCustomCertificate = try container.decode(Bool.self, forKey: .hasCustomCertificate)
		self.pendingUpdateCount = try container.decode(TelegramInteger.self, forKey: .pendingUpdateCount)
		self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
		self.lastErrorDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .lastErrorDate)
		self.lastErrorMessage = try container.decodeIfPresent(String.self, forKey: .lastErrorMessage)
		self.lastSynchronizationErrorDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .lastSynchronizationErrorDate)
		self.maxConnections = try container.decodeIfPresent(TelegramInteger.self, forKey: .maxConnections)
		self.allowedUpdates = try container.decodeIfPresent([String].self, forKey: .allowedUpdates)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("url", object: self.url)
		encoder.append("has_custom_certificate", object: self.hasCustomCertificate)
		encoder.append("pending_update_count", object: self.pendingUpdateCount)
		encoder.append("ip_address", object: self.ipAddress)
		encoder.append("last_error_date", object: self.lastErrorDate)
		encoder.append("last_error_message", object: self.lastErrorMessage)
		encoder.append("last_synchronization_error_date", object: self.lastSynchronizationErrorDate)
		encoder.append("max_connections", object: self.maxConnections)
		encoder.append("allowed_updates", object: self.allowedUpdates)
	}
}
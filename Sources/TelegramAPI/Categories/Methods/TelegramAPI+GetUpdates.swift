extension TelegramAPI {
    /// Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.
    public func getUpdates(_ input: GetUpdatesInput, completionHandler: @escaping (TelegramResult<[Update]>) -> Void) {
        self.requester.request("getUpdates", object: input, completion: completionHandler)
    }
}

//Input model for request getUpdates
public final class GetUpdatesInput: Encodable {
	///Optional
	public let offset: TelegramInteger?
	
	///Optional
	public let limit: TelegramInteger?
	
	///Optional
	public let timeout: TelegramInteger?
	
	///Optional
	public let allowedUpdates: [String]?

	public init(
		offset: TelegramInteger? = nil,
		limit: TelegramInteger? = nil,
		timeout: TelegramInteger? = nil,
		allowedUpdates: [String]? = nil
	) {
		self.offset = offset
		self.limit = limit
		self.timeout = timeout
		self.allowedUpdates = allowedUpdates
	}

	private enum CodingKeys: String, CodingKey {
		case offset
		case limit
		case timeout
		case allowedUpdates = "allowed_updates"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.offset.self, forKey: .offset)
		try container.encodeIfPresent(self.limit.self, forKey: .limit)
		try container.encodeIfPresent(self.timeout.self, forKey: .timeout)
		try container.encodeIfPresent(self.allowedUpdates.self, forKey: .allowedUpdates)
	}
}
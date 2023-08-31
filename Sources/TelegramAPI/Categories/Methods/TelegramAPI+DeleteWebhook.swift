extension TelegramAPI {
    /// Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success.
    public func deleteWebhook(_ input: DeleteWebhookInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteWebhook", object: input, completion: completionHandler)
    }
}

//Input model for request deleteWebhook
public final class DeleteWebhookInput: Encodable {
	///Optional
	public let dropPendingUpdates: Bool

	public init(
		dropPendingUpdates: Bool
	) {
		self.dropPendingUpdates = dropPendingUpdates
	}

	private enum CodingKeys: String, CodingKey {
		case dropPendingUpdates = "drop_pending_updates"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.dropPendingUpdates.self, forKey: .dropPendingUpdates)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success.
    public func deleteWebhook(_ input: DeleteWebhookInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteWebhook", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request deleteWebhook
import Foundation
public final class DeleteWebhookInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. Pass True to drop all pending updates
	public let dropPendingUpdates: Bool?

	public init(
		dropPendingUpdates: Bool? = nil
	) {
		self.dropPendingUpdates = dropPendingUpdates
	}

	private enum CodingKeys: String, CodingKey {
		case dropPendingUpdates = "drop_pending_updates"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.dropPendingUpdates.self, forKey: .dropPendingUpdates)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.dropPendingUpdates = try container.decodeIfPresent(Bool.self, forKey: .dropPendingUpdates)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
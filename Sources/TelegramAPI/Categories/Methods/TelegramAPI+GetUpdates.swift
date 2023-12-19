import Foundation

extension TelegramAPI {
    /// Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.
    public func getUpdates(_ input: GetUpdatesInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<[Update]>) -> Void) {
        self.requester.request("getUpdates", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request getUpdates
import Foundation
public final class GetUpdatesInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will be forgotten.
	public let offset: TelegramInteger?
	
	///Optional. Limits the number of updates to be retrieved. Values between 1-100 are accepted. Defaults to 100.
	public let limit: TelegramInteger?
	
	///Optional. Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
	public let timeout: TelegramInteger?
	
	///Optional. A JSON-serialized list of the update types you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the getUpdates, so unwanted updates may be received for a short period of time.
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.offset = try container.decodeIfPresent(TelegramInteger.self, forKey: .offset)
		self.limit = try container.decodeIfPresent(TelegramInteger.self, forKey: .limit)
		self.timeout = try container.decodeIfPresent(TelegramInteger.self, forKey: .timeout)
		self.allowedUpdates = try container.decodeIfPresent([String].self, forKey: .allowedUpdates)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
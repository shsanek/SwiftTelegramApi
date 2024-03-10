import Foundation

extension TelegramAPI {
    /// Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.
    public func getMyDefaultAdministratorRights(_ input: GetMyDefaultAdministratorRightsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<ChatAdministratorRights>) -> Void) {
        self.requester.request("getMyDefaultAdministratorRights", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func getMyDefaultAdministratorRights(_ input: GetMyDefaultAdministratorRightsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> ChatAdministratorRights {
        try await self.requester.request("getMyDefaultAdministratorRights", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getMyDefaultAdministratorRights
import Foundation
public final class GetMyDefaultAdministratorRightsInput: Codable, IMultiPartFromDataValueEncodable {
	///Optional. Pass True to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned.
	public let forChannels: Bool?

	public init(
		forChannels: Bool? = nil
	) {
		self.forChannels = forChannels
	}

	private enum CodingKeys: String, CodingKey {
		case forChannels = "for_channels"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.forChannels.self, forKey: .forChannels)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.forChannels = try container.decodeIfPresent(Bool.self, forKey: .forChannels)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
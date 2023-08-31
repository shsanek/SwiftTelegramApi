extension TelegramAPI {
    /// Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.
    public func getMyDefaultAdministratorRights(_ input: GetMyDefaultAdministratorRightsInput, completionHandler: @escaping (TelegramResult<ChatAdministratorRights>) -> Void) {
        self.requester.request("getMyDefaultAdministratorRights", object: input, completion: completionHandler)
    }
}

//Input model for request getMyDefaultAdministratorRights
public final class GetMyDefaultAdministratorRightsInput: Encodable {
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
}
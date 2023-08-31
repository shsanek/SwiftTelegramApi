extension TelegramAPI {
    /// Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success.
    public func setMyDefaultAdministratorRights(_ input: SetMyDefaultAdministratorRightsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyDefaultAdministratorRights", object: input, completion: completionHandler)
    }
}

//Input model for request setMyDefaultAdministratorRights
public final class SetMyDefaultAdministratorRightsInput: Encodable {
	///Optional. A JSON-serialized object describing new default administrator rights. If not specified, the default administrator rights will be cleared.
	public let rights: ChatAdministratorRights?
	
	///Optional. Pass True to change the default administrator rights of the bot in channels. Otherwise, the default administrator rights of the bot for groups and supergroups will be changed.
	public let forChannels: Bool?

	public init(
		rights: ChatAdministratorRights? = nil,
		forChannels: Bool? = nil
	) {
		self.rights = rights
		self.forChannels = forChannels
	}

	private enum CodingKeys: String, CodingKey {
		case rights
		case forChannels = "for_channels"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.rights.self, forKey: .rights)
		try container.encodeIfPresent(self.forChannels.self, forKey: .forChannels)
	}
}
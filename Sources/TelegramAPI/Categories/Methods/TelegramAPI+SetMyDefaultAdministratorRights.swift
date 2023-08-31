extension TelegramAPI {
    /// Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels. These rights will be suggested to users, but they are free to modify the list before adding the bot. Returns True on success.
    public func setMyDefaultAdministratorRights(_ input: SetMyDefaultAdministratorRightsInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setMyDefaultAdministratorRights", object: input, completion: completionHandler)
    }
}

//Input model for request setMyDefaultAdministratorRights
public final class SetMyDefaultAdministratorRightsInput: Encodable {
	///Optional
	public let rights: ChatAdministratorRights
	
	///Optional
	public let forChannels: Bool

	public init(
		rights: ChatAdministratorRights,
		forChannels: Bool
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
		try container.encode(self.rights.self, forKey: .rights)
		try container.encode(self.forChannels.self, forKey: .forChannels)
	}
}
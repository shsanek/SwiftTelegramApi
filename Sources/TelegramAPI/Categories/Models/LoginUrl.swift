import Foundation
public final class LoginUrl: Codable, IMultiPartFromDataValueEncodable {
	///An HTTPS URL to be opened with user authorization data added to the query string when the button is pressed. If the user refuses to provide authorization data, the original URL without information about the user will be opened. The data added is the same as described in Receiving authorization data.NOTE: You must always check the hash of the received data to verify the authentication and the integrity of the data as described in Checking authorization.
	public let url: String
	
	///Optional. New text of the button in forwarded messages.
	public let forwardText: String?
	
	///Optional. Username of a bot, which will be used for user authorization. See Setting up a bot for more details. If not specified, the current bot's username will be assumed. The url's domain must be the same as the domain linked with the bot. See Linking your domain to the bot for more details.
	public let botUsername: String?
	
	///Optional. Pass True to request the permission for your bot to send messages to the user.
	public let requestWriteAccess: Bool?

	public init(
		url: String,
		forwardText: String? = nil,
		botUsername: String? = nil,
		requestWriteAccess: Bool? = nil
	) {
		self.url = url
		self.forwardText = forwardText
		self.botUsername = botUsername
		self.requestWriteAccess = requestWriteAccess
	}

	private enum CodingKeys: String, CodingKey {
		case url
		case forwardText = "forward_text"
		case botUsername = "bot_username"
		case requestWriteAccess = "request_write_access"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.url.self, forKey: .url)
		try container.encodeIfPresent(self.forwardText.self, forKey: .forwardText)
		try container.encodeIfPresent(self.botUsername.self, forKey: .botUsername)
		try container.encodeIfPresent(self.requestWriteAccess.self, forKey: .requestWriteAccess)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.url = try container.decode(String.self, forKey: .url)
		self.forwardText = try container.decodeIfPresent(String.self, forKey: .forwardText)
		self.botUsername = try container.decodeIfPresent(String.self, forKey: .botUsername)
		self.requestWriteAccess = try container.decodeIfPresent(Bool.self, forKey: .requestWriteAccess)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
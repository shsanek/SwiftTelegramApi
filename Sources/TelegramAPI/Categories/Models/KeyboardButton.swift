public final class KeyboardButton: Codable, IMultiPartFromDataEncodable {
	///Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed
	public let text: String
	
	///Optional. If specified, pressing the button will open a list of suitable users. Tapping on any user will send their identifier to the bot in a “user_shared” service message. Available in private chats only.
	public let requestUser: KeyboardButtonRequestUser?
	
	///Optional. If specified, pressing the button will open a list of suitable chats. Tapping on a chat will send its identifier to the bot in a “chat_shared” service message. Available in private chats only.
	public let requestChat: KeyboardButtonRequestChat?
	
	///Optional. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only.
	public let requestContact: Bool?
	
	///Optional. If True, the user's current location will be sent when the button is pressed. Available in private chats only.
	public let requestLocation: Bool?
	
	///Optional. If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only.
	public let requestPoll: KeyboardButtonPollType?
	
	///Optional. If specified, the described Web App will be launched when the button is pressed. The Web App will be able to send a “web_app_data” service message. Available in private chats only.
	public let webApp: WebAppInfo?

	public init(
		text: String,
		requestUser: KeyboardButtonRequestUser? = nil,
		requestChat: KeyboardButtonRequestChat? = nil,
		requestContact: Bool? = nil,
		requestLocation: Bool? = nil,
		requestPoll: KeyboardButtonPollType? = nil,
		webApp: WebAppInfo? = nil
	) {
		self.text = text
		self.requestUser = requestUser
		self.requestChat = requestChat
		self.requestContact = requestContact
		self.requestLocation = requestLocation
		self.requestPoll = requestPoll
		self.webApp = webApp
	}

	private enum CodingKeys: String, CodingKey {
		case text
		case requestUser = "request_user"
		case requestChat = "request_chat"
		case requestContact = "request_contact"
		case requestLocation = "request_location"
		case requestPoll = "request_poll"
		case webApp = "web_app"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.text.self, forKey: .text)
		try container.encodeIfPresent(self.requestUser.self, forKey: .requestUser)
		try container.encodeIfPresent(self.requestChat.self, forKey: .requestChat)
		try container.encodeIfPresent(self.requestContact.self, forKey: .requestContact)
		try container.encodeIfPresent(self.requestLocation.self, forKey: .requestLocation)
		try container.encodeIfPresent(self.requestPoll.self, forKey: .requestPoll)
		try container.encodeIfPresent(self.webApp.self, forKey: .webApp)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.text = try container.decode(String.self, forKey: .text)
		self.requestUser = try container.decodeIfPresent(KeyboardButtonRequestUser.self, forKey: .requestUser)
		self.requestChat = try container.decodeIfPresent(KeyboardButtonRequestChat.self, forKey: .requestChat)
		self.requestContact = try container.decodeIfPresent(Bool.self, forKey: .requestContact)
		self.requestLocation = try container.decodeIfPresent(Bool.self, forKey: .requestLocation)
		self.requestPoll = try container.decodeIfPresent(KeyboardButtonPollType.self, forKey: .requestPoll)
		self.webApp = try container.decodeIfPresent(WebAppInfo.self, forKey: .webApp)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("text", object: self.text)
		encoder.append("request_user", object: self.requestUser)
		encoder.append("request_chat", object: self.requestChat)
		encoder.append("request_contact", object: self.requestContact)
		encoder.append("request_location", object: self.requestLocation)
		encoder.append("request_poll", object: self.requestPoll)
		encoder.append("web_app", object: self.webApp)
	}
}
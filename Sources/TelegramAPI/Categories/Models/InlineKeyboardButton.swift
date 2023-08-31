public final class InlineKeyboardButton: Codable, IMultiPartFromDataEncodable {
	///Label text on the button
	public let text: String
	
	///Optional. HTTP or tg:// URL to be opened when the button is pressed. Links tg://user?id=<user_id> can be used to mention a user by their ID without using a username, if this is allowed by their privacy settings.
	public let url: String?
	
	///Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
	public let callbackData: String?
	
	///Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery. Available only in private chats between a user and the bot.
	public let webApp: WebAppInfo?
	
	///Optional. An HTTPS URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.
	public let loginUrl: LoginUrl?
	
	///Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. May be empty, in which case just the bot's username will be inserted.
	public let switchInlineQuery: String?
	
	///Optional. If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. May be empty, in which case only the bot's username will be inserted.This offers a quick way for the user to open your bot in inline mode in the same chat - good for selecting something from multiple options.
	public let switchInlineQueryCurrentChat: String?
	
	///Optional. If set, pressing the button will prompt the user to select one of their chats of the specified type, open that chat and insert the bot's username and the specified inline query in the input field
	public let switchInlineQueryChosenChat: SwitchInlineQueryChosenChat?
	
	///Optional. Description of the game that will be launched when the user presses the button.NOTE: This type of button must always be the first button in the first row.
	public let callbackGame: CallbackGame?
	
	///Optional. Specify True, to send a Pay button.NOTE: This type of button must always be the first button in the first row and can only be used in invoice messages.
	public let pay: Bool?

	public init(
		text: String,
		url: String? = nil,
		callbackData: String? = nil,
		webApp: WebAppInfo? = nil,
		loginUrl: LoginUrl? = nil,
		switchInlineQuery: String? = nil,
		switchInlineQueryCurrentChat: String? = nil,
		switchInlineQueryChosenChat: SwitchInlineQueryChosenChat? = nil,
		callbackGame: CallbackGame? = nil,
		pay: Bool? = nil
	) {
		self.text = text
		self.url = url
		self.callbackData = callbackData
		self.webApp = webApp
		self.loginUrl = loginUrl
		self.switchInlineQuery = switchInlineQuery
		self.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
		self.switchInlineQueryChosenChat = switchInlineQueryChosenChat
		self.callbackGame = callbackGame
		self.pay = pay
	}

	private enum CodingKeys: String, CodingKey {
		case text
		case url
		case callbackData = "callback_data"
		case webApp = "web_app"
		case loginUrl = "login_url"
		case switchInlineQuery = "switch_inline_query"
		case switchInlineQueryCurrentChat = "switch_inline_query_current_chat"
		case switchInlineQueryChosenChat = "switch_inline_query_chosen_chat"
		case callbackGame = "callback_game"
		case pay
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.text.self, forKey: .text)
		try container.encodeIfPresent(self.url.self, forKey: .url)
		try container.encodeIfPresent(self.callbackData.self, forKey: .callbackData)
		try container.encodeIfPresent(self.webApp.self, forKey: .webApp)
		try container.encodeIfPresent(self.loginUrl.self, forKey: .loginUrl)
		try container.encodeIfPresent(self.switchInlineQuery.self, forKey: .switchInlineQuery)
		try container.encodeIfPresent(self.switchInlineQueryCurrentChat.self, forKey: .switchInlineQueryCurrentChat)
		try container.encodeIfPresent(self.switchInlineQueryChosenChat.self, forKey: .switchInlineQueryChosenChat)
		try container.encodeIfPresent(self.callbackGame.self, forKey: .callbackGame)
		try container.encodeIfPresent(self.pay.self, forKey: .pay)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.text = try container.decode(String.self, forKey: .text)
		self.url = try container.decodeIfPresent(String.self, forKey: .url)
		self.callbackData = try container.decodeIfPresent(String.self, forKey: .callbackData)
		self.webApp = try container.decodeIfPresent(WebAppInfo.self, forKey: .webApp)
		self.loginUrl = try container.decodeIfPresent(LoginUrl.self, forKey: .loginUrl)
		self.switchInlineQuery = try container.decodeIfPresent(String.self, forKey: .switchInlineQuery)
		self.switchInlineQueryCurrentChat = try container.decodeIfPresent(String.self, forKey: .switchInlineQueryCurrentChat)
		self.switchInlineQueryChosenChat = try container.decodeIfPresent(SwitchInlineQueryChosenChat.self, forKey: .switchInlineQueryChosenChat)
		self.callbackGame = try container.decodeIfPresent(CallbackGame.self, forKey: .callbackGame)
		self.pay = try container.decodeIfPresent(Bool.self, forKey: .pay)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("text", object: self.text)
		encoder.append("url", object: self.url)
		encoder.append("callback_data", object: self.callbackData)
		encoder.append("web_app", object: self.webApp)
		encoder.append("login_url", object: self.loginUrl)
		encoder.append("switch_inline_query", object: self.switchInlineQuery)
		encoder.append("switch_inline_query_current_chat", object: self.switchInlineQueryCurrentChat)
		encoder.append("switch_inline_query_chosen_chat", object: self.switchInlineQueryChosenChat)
		encoder.append("callback_game", object: self.callbackGame)
		encoder.append("pay", object: self.pay)
	}
}
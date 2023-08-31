extension TelegramAPI {
    /// Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success.
    public func setChatMenuButton(_ input: SetChatMenuButtonInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatMenuButton", object: input, completion: completionHandler)
    }
}

//Input model for request setChatMenuButton
public final class SetChatMenuButtonInput: Encodable {
	///Optional. Unique identifier for the target private chat. If not specified, default bot's menu button will be changed
	public let chatId: TelegramInteger?
	
	///Optional. A JSON-serialized object for the bot's new menu button. Defaults to MenuButtonDefault
	public let menuButton: MenuButton?

	public init(
		chatId: TelegramInteger? = nil,
		menuButton: MenuButton? = nil
	) {
		self.chatId = chatId
		self.menuButton = menuButton
	}

	private enum CodingKeys: String, CodingKey {
		case chatId = "chat_id"
		case menuButton = "menu_button"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.chatId.self, forKey: .chatId)
		try container.encodeIfPresent(self.menuButton.self, forKey: .menuButton)
	}
}
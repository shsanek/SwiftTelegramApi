extension TelegramAPI {
    /// Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success.
    public func setChatMenuButton(_ input: SetChatMenuButtonInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatMenuButton", object: input, completion: completionHandler)
    }
}

//Input model for request setChatMenuButton
public final class SetChatMenuButtonInput: Encodable {
	///Optional
	public let chatId: TelegramInteger?
	
	///Optional
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
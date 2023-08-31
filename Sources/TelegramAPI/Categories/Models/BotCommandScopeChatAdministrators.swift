public final class BotCommandScopeChatAdministrators: IMultiPartFromDataEncodable {
	///Scope type, must be chat_administrators
	public let type: String
	
	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer

	public init(
		type: String,
		chatId: TelegramIdentifierContainer
	) {
		self.type = type
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("chat_id", object: self.chatId)
	}
}
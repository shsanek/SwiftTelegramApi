public final class BotCommandScopeChatMember: IMultiPartFromDataEncodable {
	///Scope type, must be chat_member
	public let type: String
	
	///Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Unique identifier of the target user
	public let userId: TelegramInteger

	public init(
		type: String,
		chatId: TelegramIdentifierContainer,
		userId: TelegramInteger
	) {
		self.type = type
		self.chatId = chatId
		self.userId = userId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("type", object: self.type)
		encoder.append("chat_id", object: self.chatId)
		encoder.append("user_id", object: self.userId)
	}
}
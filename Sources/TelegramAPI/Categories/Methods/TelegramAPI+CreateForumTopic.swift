extension TelegramAPI {
    /// Use this method to create a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns information about the created topic as a ForumTopic object.
    public func createForumTopic(_ input: CreateForumTopicInput, completionHandler: @escaping (TelegramResult<ForumTopic>) -> Void) {
        self.requester.request("createForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request createForumTopic
public final class CreateForumTopicInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let name: String
	
	///Optional
	public let iconColor: TelegramInteger
	
	///Optional
	public let iconCustomEmojiId: String

	public init(
		chatId: TelegramIdentifierContainer,
		name: String,
		iconColor: TelegramInteger,
		iconCustomEmojiId: String
	) {
		self.chatId = chatId
		self.name = name
		self.iconColor = iconColor
		self.iconCustomEmojiId = iconCustomEmojiId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("name", object: self.name)
		encoder.append("icon_color", object: self.iconColor)
		encoder.append("icon_custom_emoji_id", object: self.iconCustomEmojiId)
	}
}
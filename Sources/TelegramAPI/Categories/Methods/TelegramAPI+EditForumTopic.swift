extension TelegramAPI {
    /// Use this method to edit name and icon of a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.
    public func editForumTopic(_ input: EditForumTopicInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request editForumTopic
public final class EditForumTopicInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let messageThreadId: TelegramInteger
	
	///Optional
	public let name: String
	
	///Optional
	public let iconCustomEmojiId: String

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		name: String,
		iconCustomEmojiId: String
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.name = name
		self.iconCustomEmojiId = iconCustomEmojiId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("name", object: self.name)
		encoder.append("icon_custom_emoji_id", object: self.iconCustomEmojiId)
	}
}
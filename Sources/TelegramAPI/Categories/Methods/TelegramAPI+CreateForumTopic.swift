extension TelegramAPI {
    /// Use this method to create a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have the can_manage_topics administrator rights. Returns information about the created topic as a ForumTopic object.
    public func createForumTopic(_ input: CreateForumTopicInput, completionHandler: @escaping (TelegramResult<ForumTopic>) -> Void) {
        self.requester.request("createForumTopic", object: input, completion: completionHandler)
    }
}

//Input model for request createForumTopic
public final class CreateForumTopicInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Topic name, 1-128 characters
	public let name: String
	
	///Optional. Color of the topic icon in RGB format. Currently, must be one of 7322096 (0x6FB9F0), 16766590 (0xFFD67E), 13338331 (0xCB86DB), 9367192 (0x8EEE98), 16749490 (0xFF93B2), or 16478047 (0xFB6F5F)
	public let iconColor: TelegramInteger?
	
	///Optional. Unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers.
	public let iconCustomEmojiId: String?

	public init(
		chatId: TelegramIdentifierContainer,
		name: String,
		iconColor: TelegramInteger? = nil,
		iconCustomEmojiId: String? = nil
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
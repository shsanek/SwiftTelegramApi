import Foundation

extension TelegramAPI {
    /// Use this method to edit name and icon of a topic in a forum supergroup chat. The bot must be an administrator in the chat for this to work and must have can_manage_topics administrator rights, unless it is the creator of the topic. Returns True on success.
    public func editForumTopic(_ input: EditForumTopicInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("editForumTopic", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func editForumTopic(_ input: EditForumTopicInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("editForumTopic", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request editForumTopic
public final class EditForumTopicInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier for the target message thread of the forum topic
	public let messageThreadId: TelegramInteger
	
	///Optional. New topic name, 0-128 characters. If not specified or empty, the current name of the topic will be kept
	public let name: String?
	
	///Optional. New unique identifier of the custom emoji shown as the topic icon. Use getForumTopicIconStickers to get all allowed custom emoji identifiers. Pass an empty string to remove the icon. If not specified, the current icon will be kept
	public let iconCustomEmojiId: String?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger,
		name: String? = nil,
		iconCustomEmojiId: String? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.name = name
		self.iconCustomEmojiId = iconCustomEmojiId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("name", object: self.name)
		try encoder.append("icon_custom_emoji_id", object: self.iconCustomEmojiId)
	}
}
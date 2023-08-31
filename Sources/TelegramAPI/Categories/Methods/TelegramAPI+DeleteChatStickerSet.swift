extension TelegramAPI {
    /// Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
    public func deleteChatStickerSet(_ input: DeleteChatStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("deleteChatStickerSet", object: input, completion: completionHandler)
    }
}

//Input model for request deleteChatStickerSet
public final class DeleteChatStickerSetInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer

	public init(
		chatId: TelegramIdentifierContainer
	) {
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
	}
}
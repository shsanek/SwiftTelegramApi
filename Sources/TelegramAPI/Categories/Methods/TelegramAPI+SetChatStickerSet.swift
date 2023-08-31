extension TelegramAPI {
    /// Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
    public func setChatStickerSet(_ input: SetChatStickerSetInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("setChatStickerSet", object: input, completion: completionHandler)
    }
}

//Input model for request setChatStickerSet
public final class SetChatStickerSetInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Yes
	public let stickerSetName: String

	public init(
		chatId: TelegramIdentifierContainer,
		stickerSetName: String
	) {
		self.chatId = chatId
		self.stickerSetName = stickerSetName
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("sticker_set_name", object: self.stickerSetName)
	}
}
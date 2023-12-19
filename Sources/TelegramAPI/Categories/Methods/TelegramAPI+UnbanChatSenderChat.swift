import Foundation

extension TelegramAPI {
    /// Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success.
    public func unbanChatSenderChat(_ input: UnbanChatSenderChatInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("unbanChatSenderChat", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request unbanChatSenderChat
public final class UnbanChatSenderChatInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Yes. Unique identifier of the target sender chat
	public let senderChatId: TelegramInteger

	public init(
		chatId: TelegramIdentifierContainer,
		senderChatId: TelegramInteger
	) {
		self.chatId = chatId
		self.senderChatId = senderChatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("sender_chat_id", object: self.senderChatId)
	}
}
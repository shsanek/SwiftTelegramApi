import Foundation

extension TelegramAPI {
    /// Use this method to get the number of members in a chat. Returns Int on success.
    public func getChatMemberCount(_ input: GetChatMemberCountInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<TelegramInteger>) -> Void) {
        self.requester.request("getChatMemberCount", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getChatMemberCount(_ input: GetChatMemberCountInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> TelegramInteger {
        try await self.requester.request("getChatMemberCount", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getChatMemberCount
public final class GetChatMemberCountInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer

	public init(
		chatId: TelegramIdentifierContainer
	) {
		self.chatId = chatId
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
	}
}
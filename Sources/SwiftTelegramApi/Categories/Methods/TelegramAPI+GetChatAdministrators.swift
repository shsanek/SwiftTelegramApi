import Foundation

extension TelegramAPI {
    /// Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.
    public func getChatAdministrators(_ input: GetChatAdministratorsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<[ChatMember]>) -> Void) {
        self.requester.request("getChatAdministrators", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func getChatAdministrators(_ input: GetChatAdministratorsInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> [ChatMember] {
        try await self.requester.request("getChatAdministrators", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request getChatAdministrators
public final class GetChatAdministratorsInput: IMultiPartFromDataEncodable {
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
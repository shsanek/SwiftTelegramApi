import Foundation

extension TelegramAPI {
    /// A simple method for testing your bot's authentication token. Requires no parameters. Returns basic information about the bot in form of a User object.
    public func getMe(_ input: EmptyObject, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<User>) -> Void) {
        self.requester.request("getMe", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getMe(_ input: EmptyObject, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> User {
        try await self.requester.request("getMe", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}
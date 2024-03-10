import Foundation

extension TelegramAPI {
    /// Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
    public func getWebhookInfo(_ input: EmptyObject, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<WebhookInfo>) -> Void) {
        self.requester.request("getWebhookInfo", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func getWebhookInfo(_ input: EmptyObject, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> WebhookInfo {
        try await self.requester.request("getWebhookInfo", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}
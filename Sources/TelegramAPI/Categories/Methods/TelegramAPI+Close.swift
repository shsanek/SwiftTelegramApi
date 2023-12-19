import Foundation

extension TelegramAPI {
    /// Use this method to close the bot instance before moving it from one local server to another. You need to delete the webhook before calling this method to ensure that the bot isn't launched again after server restart. The method will return error 429 in the first 10 minutes after the bot is launched. Returns True on success. Requires no parameters.
    public func close(_ input: EmptyObject, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("close", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}
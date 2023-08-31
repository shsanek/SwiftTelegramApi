extension TelegramAPI {
    /// Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
    public func getWebhookInfo(_ input: EmptyObject, completionHandler: @escaping (TelegramResult<WebhookInfo>) -> Void) {
        self.requester.request("getWebhookInfo", object: input, completion: completionHandler)
    }
}
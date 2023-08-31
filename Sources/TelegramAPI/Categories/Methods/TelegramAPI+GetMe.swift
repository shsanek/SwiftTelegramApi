extension TelegramAPI {
    /// A simple method for testing your bot's authentication token. Requires no parameters. Returns basic information about the bot in form of a User object.
    public func getMe(_ input: EmptyObject, completionHandler: @escaping (TelegramResult<User>) -> Void) {
        self.requester.request("getMe", object: input, completion: completionHandler)
    }
}
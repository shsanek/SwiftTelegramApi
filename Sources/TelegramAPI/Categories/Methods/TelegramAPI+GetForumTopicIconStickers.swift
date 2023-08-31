extension TelegramAPI {
    /// Use this method to get custom emoji stickers, which can be used as a forum topic icon by any user. Requires no parameters. Returns an Array of Sticker objects.
    public func getForumTopicIconStickers(_ input: EmptyObject, completionHandler: @escaping (TelegramResult<[Sticker]>) -> Void) {
        self.requester.request("getForumTopicIconStickers", object: input, completion: completionHandler)
    }
}
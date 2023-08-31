extension TelegramAPI {
    /// Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
    public func answerCallbackQuery(_ input: AnswerCallbackQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerCallbackQuery", object: input, completion: completionHandler)
    }
}

//Input model for request answerCallbackQuery
public final class AnswerCallbackQueryInput: Encodable {
	///Yes
	public let callbackQueryId: String
	
	///Optional
	public let text: String?
	
	///Optional
	public let showAlert: Bool?
	
	///Optional
	public let url: String?
	
	///Optional
	public let cacheTime: TelegramInteger?

	public init(
		callbackQueryId: String,
		text: String? = nil,
		showAlert: Bool? = nil,
		url: String? = nil,
		cacheTime: TelegramInteger? = nil
	) {
		self.callbackQueryId = callbackQueryId
		self.text = text
		self.showAlert = showAlert
		self.url = url
		self.cacheTime = cacheTime
	}

	private enum CodingKeys: String, CodingKey {
		case callbackQueryId = "callback_query_id"
		case text
		case showAlert = "show_alert"
		case url
		case cacheTime = "cache_time"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.callbackQueryId.self, forKey: .callbackQueryId)
		try container.encodeIfPresent(self.text.self, forKey: .text)
		try container.encodeIfPresent(self.showAlert.self, forKey: .showAlert)
		try container.encodeIfPresent(self.url.self, forKey: .url)
		try container.encodeIfPresent(self.cacheTime.self, forKey: .cacheTime)
	}
}
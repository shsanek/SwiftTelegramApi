import Foundation

extension TelegramAPI {
    /// Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
    public func answerCallbackQuery(_ input: AnswerCallbackQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerCallbackQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func answerCallbackQuery(_ input: AnswerCallbackQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("answerCallbackQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request answerCallbackQuery
import Foundation
public final class AnswerCallbackQueryInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier for the query to be answered
	public let callbackQueryId: String
	
	///Optional. Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
	public let text: String?
	
	///Optional. If True, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
	public let showAlert: Bool?
	
	///Optional. URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @BotFather, specify the URL that opens your game - note that this will only work if the query comes from a callback_game button.Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
	public let url: String?
	
	///Optional. The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.callbackQueryId = try container.decode(String.self, forKey: .callbackQueryId)
		self.text = try container.decodeIfPresent(String.self, forKey: .text)
		self.showAlert = try container.decodeIfPresent(Bool.self, forKey: .showAlert)
		self.url = try container.decodeIfPresent(String.self, forKey: .url)
		self.cacheTime = try container.decodeIfPresent(TelegramInteger.self, forKey: .cacheTime)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
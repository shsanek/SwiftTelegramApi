import Foundation

extension TelegramAPI {
    /// Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed.
    public func answerInlineQuery(_ input: AnswerInlineQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerInlineQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func answerInlineQuery(_ input: AnswerInlineQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("answerInlineQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request answerInlineQuery
import Foundation
public final class AnswerInlineQueryInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier for the answered query
	public let inlineQueryId: String
	
	///Yes. A JSON-serialized array of results for the inline query
	public let results: [InlineQueryResult]
	
	///Optional. The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
	public let cacheTime: TelegramInteger?
	
	///Optional. Pass True if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query.
	public let isPersonal: Bool?
	
	///Optional. Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination. Offset length can't exceed 64 bytes.
	public let nextOffset: String?
	
	///Optional. A JSON-serialized object describing a button to be shown above inline query results
	public let button: InlineQueryResultsButton?

	public init(
		inlineQueryId: String,
		results: [InlineQueryResult],
		cacheTime: TelegramInteger? = nil,
		isPersonal: Bool? = nil,
		nextOffset: String? = nil,
		button: InlineQueryResultsButton? = nil
	) {
		self.inlineQueryId = inlineQueryId
		self.results = results
		self.cacheTime = cacheTime
		self.isPersonal = isPersonal
		self.nextOffset = nextOffset
		self.button = button
	}

	private enum CodingKeys: String, CodingKey {
		case inlineQueryId = "inline_query_id"
		case results
		case cacheTime = "cache_time"
		case isPersonal = "is_personal"
		case nextOffset = "next_offset"
		case button
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.inlineQueryId.self, forKey: .inlineQueryId)
		try container.encode(self.results.self, forKey: .results)
		try container.encodeIfPresent(self.cacheTime.self, forKey: .cacheTime)
		try container.encodeIfPresent(self.isPersonal.self, forKey: .isPersonal)
		try container.encodeIfPresent(self.nextOffset.self, forKey: .nextOffset)
		try container.encodeIfPresent(self.button.self, forKey: .button)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.inlineQueryId = try container.decode(String.self, forKey: .inlineQueryId)
		self.results = try container.decode([InlineQueryResult].self, forKey: .results)
		self.cacheTime = try container.decodeIfPresent(TelegramInteger.self, forKey: .cacheTime)
		self.isPersonal = try container.decodeIfPresent(Bool.self, forKey: .isPersonal)
		self.nextOffset = try container.decodeIfPresent(String.self, forKey: .nextOffset)
		self.button = try container.decodeIfPresent(InlineQueryResultsButton.self, forKey: .button)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
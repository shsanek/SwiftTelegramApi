extension TelegramAPI {
    /// Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed.
    public func answerInlineQuery(_ input: AnswerInlineQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerInlineQuery", object: input, completion: completionHandler)
    }
}

//Input model for request answerInlineQuery
public final class AnswerInlineQueryInput: Encodable {
	///Yes
	public let inlineQueryId: String
	
	///Yes
	public let results: [InlineQueryResult]
	
	///Optional
	public let cacheTime: TelegramInteger
	
	///Optional
	public let isPersonal: Bool
	
	///Optional
	public let nextOffset: String
	
	///Optional
	public let button: InlineQueryResultsButton

	public init(
		inlineQueryId: String,
		results: [InlineQueryResult],
		cacheTime: TelegramInteger,
		isPersonal: Bool,
		nextOffset: String,
		button: InlineQueryResultsButton
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
		try container.encode(self.cacheTime.self, forKey: .cacheTime)
		try container.encode(self.isPersonal.self, forKey: .isPersonal)
		try container.encode(self.nextOffset.self, forKey: .nextOffset)
		try container.encode(self.button.self, forKey: .button)
	}
}
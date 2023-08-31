extension TelegramAPI {
    /// Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned.
    public func answerWebAppQuery(_ input: AnswerWebAppQueryInput, completionHandler: @escaping (TelegramResult<SentWebAppMessage>) -> Void) {
        self.requester.request("answerWebAppQuery", object: input, completion: completionHandler)
    }
}

//Input model for request answerWebAppQuery
public final class AnswerWebAppQueryInput: Encodable {
	///Yes
	public let webAppQueryId: String
	
	///Yes
	public let result: InlineQueryResult

	public init(
		webAppQueryId: String,
		result: InlineQueryResult
	) {
		self.webAppQueryId = webAppQueryId
		self.result = result
	}

	private enum CodingKeys: String, CodingKey {
		case webAppQueryId = "web_app_query_id"
		case result
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.webAppQueryId.self, forKey: .webAppQueryId)
		try container.encode(self.result.self, forKey: .result)
	}
}
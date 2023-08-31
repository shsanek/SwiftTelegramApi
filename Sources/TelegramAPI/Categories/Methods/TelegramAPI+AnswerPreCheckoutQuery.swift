extension TelegramAPI {
    /// Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
    public func answerPreCheckoutQuery(_ input: AnswerPreCheckoutQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerPreCheckoutQuery", object: input, completion: completionHandler)
    }
}

//Input model for request answerPreCheckoutQuery
public final class AnswerPreCheckoutQueryInput: Encodable {
	///Yes
	public let preCheckoutQueryId: String
	
	///Yes
	public let ok: Bool
	
	///Optional
	public let errorMessage: String

	public init(
		preCheckoutQueryId: String,
		ok: Bool,
		errorMessage: String
	) {
		self.preCheckoutQueryId = preCheckoutQueryId
		self.ok = ok
		self.errorMessage = errorMessage
	}

	private enum CodingKeys: String, CodingKey {
		case preCheckoutQueryId = "pre_checkout_query_id"
		case ok
		case errorMessage = "error_message"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.preCheckoutQueryId.self, forKey: .preCheckoutQueryId)
		try container.encode(self.ok.self, forKey: .ok)
		try container.encode(self.errorMessage.self, forKey: .errorMessage)
	}
}
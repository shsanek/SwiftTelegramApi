extension TelegramAPI {
    /// If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned.
    public func answerShippingQuery(_ input: AnswerShippingQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerShippingQuery", object: input, completion: completionHandler)
    }
}

//Input model for request answerShippingQuery
public final class AnswerShippingQueryInput: Encodable {
	///Yes
	public let shippingQueryId: String
	
	///Yes
	public let ok: Bool
	
	///Optional
	public let shippingOptions: [ShippingOption]
	
	///Optional
	public let errorMessage: String

	public init(
		shippingQueryId: String,
		ok: Bool,
		shippingOptions: [ShippingOption],
		errorMessage: String
	) {
		self.shippingQueryId = shippingQueryId
		self.ok = ok
		self.shippingOptions = shippingOptions
		self.errorMessage = errorMessage
	}

	private enum CodingKeys: String, CodingKey {
		case shippingQueryId = "shipping_query_id"
		case ok
		case shippingOptions = "shipping_options"
		case errorMessage = "error_message"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.shippingQueryId.self, forKey: .shippingQueryId)
		try container.encode(self.ok.self, forKey: .ok)
		try container.encode(self.shippingOptions.self, forKey: .shippingOptions)
		try container.encode(self.errorMessage.self, forKey: .errorMessage)
	}
}
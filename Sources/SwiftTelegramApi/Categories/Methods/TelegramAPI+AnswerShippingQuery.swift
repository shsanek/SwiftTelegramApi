import Foundation

extension TelegramAPI {
    /// If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned.
    public func answerShippingQuery(_ input: AnswerShippingQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerShippingQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func answerShippingQuery(_ input: AnswerShippingQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Bool {
        try await self.requester.request("answerShippingQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request answerShippingQuery
import Foundation
public final class AnswerShippingQueryInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier for the query to be answered
	public let shippingQueryId: String
	
	///Yes. Pass True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
	public let ok: Bool
	
	///Optional. Required if ok is True. A JSON-serialized array of available shipping options.
	public let shippingOptions: [ShippingOption]?
	
	///Optional. Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. "Sorry, delivery to your desired address is unavailable'). Telegram will display this message to the user.
	public let errorMessage: String?

	public init(
		shippingQueryId: String,
		ok: Bool,
		shippingOptions: [ShippingOption]? = nil,
		errorMessage: String? = nil
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
		try container.encodeIfPresent(self.shippingOptions.self, forKey: .shippingOptions)
		try container.encodeIfPresent(self.errorMessage.self, forKey: .errorMessage)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.shippingQueryId = try container.decode(String.self, forKey: .shippingQueryId)
		self.ok = try container.decode(Bool.self, forKey: .ok)
		self.shippingOptions = try container.decodeIfPresent([ShippingOption].self, forKey: .shippingOptions)
		self.errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
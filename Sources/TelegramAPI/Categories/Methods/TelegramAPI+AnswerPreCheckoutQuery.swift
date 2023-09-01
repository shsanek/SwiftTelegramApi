extension TelegramAPI {
    /// Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
    public func answerPreCheckoutQuery(_ input: AnswerPreCheckoutQueryInput, completionHandler: @escaping (TelegramResult<Bool>) -> Void) {
        self.requester.request("answerPreCheckoutQuery", object: input, completion: completionHandler)
    }
}

//Input model for request answerPreCheckoutQuery
import Foundation
public final class AnswerPreCheckoutQueryInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier for the query to be answered
	public let preCheckoutQueryId: String
	
	///Yes. Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
	public let ok: Bool
	
	///Optional. Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
	public let errorMessage: String?

	public init(
		preCheckoutQueryId: String,
		ok: Bool,
		errorMessage: String? = nil
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
		try container.encodeIfPresent(self.errorMessage.self, forKey: .errorMessage)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.preCheckoutQueryId = try container.decode(String.self, forKey: .preCheckoutQueryId)
		self.ok = try container.decode(Bool.self, forKey: .ok)
		self.errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
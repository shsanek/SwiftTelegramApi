import Foundation

extension TelegramAPI {
    /// Use this method to set the result of an interaction with a Web App and send a corresponding message on behalf of the user to the chat from which the query originated. On success, a SentWebAppMessage object is returned.
    public func answerWebAppQuery(_ input: AnswerWebAppQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<SentWebAppMessage>) -> Void) {
        self.requester.request("answerWebAppQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func answerWebAppQuery(_ input: AnswerWebAppQueryInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> SentWebAppMessage {
        try await self.requester.request("answerWebAppQuery", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request answerWebAppQuery
import Foundation
public final class AnswerWebAppQueryInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Unique identifier for the query to be answered
	public let webAppQueryId: String
	
	///Yes. A JSON-serialized object describing the message to be sent
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.webAppQueryId = try container.decode(String.self, forKey: .webAppQueryId)
		self.result = try container.decode(InlineQueryResult.self, forKey: .result)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
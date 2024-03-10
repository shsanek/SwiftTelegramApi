import Foundation
public final class Poll: Codable, IMultiPartFromDataValueEncodable {
	///Unique poll identifier
	public let id: String
	
	///Poll question, 1-300 characters
	public let question: String
	
	///List of poll options
	public let options: [PollOption]
	
	///Total number of users that voted in the poll
	public let totalVoterCount: TelegramInteger
	
	///True, if the poll is closed
	public let isClosed: Bool
	
	///True, if the poll is anonymous
	public let isAnonymous: Bool
	
	///Poll type, currently can be “regular” or “quiz”
	public let type: String
	
	///True, if the poll allows multiple answers
	public let allowsMultipleAnswers: Bool
	
	///Optional. 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot.
	public let correctOptionId: TelegramInteger?
	
	///Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
	public let explanation: String?
	
	///Optional. Special entities like usernames, URLs, bot commands, etc. that appear in the explanation
	public let explanationEntities: [MessageEntity]?
	
	///Optional. Amount of time in seconds the poll will be active after creation
	public let openPeriod: TelegramInteger?
	
	///Optional. Point in time (Unix timestamp) when the poll will be automatically closed
	public let closeDate: TelegramInteger?

	public init(
		id: String,
		question: String,
		options: [PollOption],
		totalVoterCount: TelegramInteger,
		isClosed: Bool,
		isAnonymous: Bool,
		type: String,
		allowsMultipleAnswers: Bool,
		correctOptionId: TelegramInteger? = nil,
		explanation: String? = nil,
		explanationEntities: [MessageEntity]? = nil,
		openPeriod: TelegramInteger? = nil,
		closeDate: TelegramInteger? = nil
	) {
		self.id = id
		self.question = question
		self.options = options
		self.totalVoterCount = totalVoterCount
		self.isClosed = isClosed
		self.isAnonymous = isAnonymous
		self.type = type
		self.allowsMultipleAnswers = allowsMultipleAnswers
		self.correctOptionId = correctOptionId
		self.explanation = explanation
		self.explanationEntities = explanationEntities
		self.openPeriod = openPeriod
		self.closeDate = closeDate
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case question
		case options
		case totalVoterCount = "total_voter_count"
		case isClosed = "is_closed"
		case isAnonymous = "is_anonymous"
		case type
		case allowsMultipleAnswers = "allows_multiple_answers"
		case correctOptionId = "correct_option_id"
		case explanation
		case explanationEntities = "explanation_entities"
		case openPeriod = "open_period"
		case closeDate = "close_date"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.id.self, forKey: .id)
		try container.encode(self.question.self, forKey: .question)
		try container.encode(self.options.self, forKey: .options)
		try container.encode(self.totalVoterCount.self, forKey: .totalVoterCount)
		try container.encode(self.isClosed.self, forKey: .isClosed)
		try container.encode(self.isAnonymous.self, forKey: .isAnonymous)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.allowsMultipleAnswers.self, forKey: .allowsMultipleAnswers)
		try container.encodeIfPresent(self.correctOptionId.self, forKey: .correctOptionId)
		try container.encodeIfPresent(self.explanation.self, forKey: .explanation)
		try container.encodeIfPresent(self.explanationEntities.self, forKey: .explanationEntities)
		try container.encodeIfPresent(self.openPeriod.self, forKey: .openPeriod)
		try container.encodeIfPresent(self.closeDate.self, forKey: .closeDate)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decode(String.self, forKey: .id)
		self.question = try container.decode(String.self, forKey: .question)
		self.options = try container.decode([PollOption].self, forKey: .options)
		self.totalVoterCount = try container.decode(TelegramInteger.self, forKey: .totalVoterCount)
		self.isClosed = try container.decode(Bool.self, forKey: .isClosed)
		self.isAnonymous = try container.decode(Bool.self, forKey: .isAnonymous)
		self.type = try container.decode(String.self, forKey: .type)
		self.allowsMultipleAnswers = try container.decode(Bool.self, forKey: .allowsMultipleAnswers)
		self.correctOptionId = try container.decodeIfPresent(TelegramInteger.self, forKey: .correctOptionId)
		self.explanation = try container.decodeIfPresent(String.self, forKey: .explanation)
		self.explanationEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .explanationEntities)
		self.openPeriod = try container.decodeIfPresent(TelegramInteger.self, forKey: .openPeriod)
		self.closeDate = try container.decodeIfPresent(TelegramInteger.self, forKey: .closeDate)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
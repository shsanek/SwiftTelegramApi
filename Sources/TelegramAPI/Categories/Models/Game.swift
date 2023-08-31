public final class Game: Codable, IMultiPartFromDataEncodable {
	///Title of the game
	public let title: String
	
	///Description of the game
	public let description: String
	
	///Photo that will be displayed in the game message in chats.
	public let photo: [PhotoSize]
	
	///Optional. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
	public let text: String?
	
	///Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
	public let textEntities: [MessageEntity]?
	
	///Optional. Animation that will be displayed in the game message in chats. Upload via BotFather
	public let animation: Animation?

	public init(
		title: String,
		description: String,
		photo: [PhotoSize],
		text: String? = nil,
		textEntities: [MessageEntity]? = nil,
		animation: Animation? = nil
	) {
		self.title = title
		self.description = description
		self.photo = photo
		self.text = text
		self.textEntities = textEntities
		self.animation = animation
	}

	private enum CodingKeys: String, CodingKey {
		case title
		case description
		case photo
		case text
		case textEntities = "text_entities"
		case animation
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.description.self, forKey: .description)
		try container.encode(self.photo.self, forKey: .photo)
		try container.encodeIfPresent(self.text.self, forKey: .text)
		try container.encodeIfPresent(self.textEntities.self, forKey: .textEntities)
		try container.encodeIfPresent(self.animation.self, forKey: .animation)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decode(String.self, forKey: .description)
		self.photo = try container.decode([PhotoSize].self, forKey: .photo)
		self.text = try container.decodeIfPresent(String.self, forKey: .text)
		self.textEntities = try container.decodeIfPresent([MessageEntity].self, forKey: .textEntities)
		self.animation = try container.decodeIfPresent(Animation.self, forKey: .animation)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("title", object: self.title)
		encoder.append("description", object: self.description)
		encoder.append("photo", object: self.photo)
		encoder.append("text", object: self.text)
		encoder.append("text_entities", object: self.textEntities)
		encoder.append("animation", object: self.animation)
	}
}
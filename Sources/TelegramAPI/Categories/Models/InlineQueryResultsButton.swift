public final class InlineQueryResultsButton: Codable, IMultiPartFromDataEncodable {
	///Label text on the button
	public let text: String
	
	///Optional. Description of the Web App that will be launched when the user presses the button. The Web App will be able to switch back to the inline mode using the method switchInlineQuery inside the Web App.
	public let webApp: WebAppInfo?
	
	///Optional. Deep-linking parameter for the /start message sent to the bot when a user presses the button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a 'Connect your YouTube account' button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an OAuth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.
	public let startParameter: String?

	public init(
		text: String,
		webApp: WebAppInfo? = nil,
		startParameter: String? = nil
	) {
		self.text = text
		self.webApp = webApp
		self.startParameter = startParameter
	}

	private enum CodingKeys: String, CodingKey {
		case text
		case webApp = "web_app"
		case startParameter = "start_parameter"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.text.self, forKey: .text)
		try container.encodeIfPresent(self.webApp.self, forKey: .webApp)
		try container.encodeIfPresent(self.startParameter.self, forKey: .startParameter)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.text = try container.decode(String.self, forKey: .text)
		self.webApp = try container.decodeIfPresent(WebAppInfo.self, forKey: .webApp)
		self.startParameter = try container.decodeIfPresent(String.self, forKey: .startParameter)
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("text", object: self.text)
		encoder.append("web_app", object: self.webApp)
		encoder.append("start_parameter", object: self.startParameter)
	}
}
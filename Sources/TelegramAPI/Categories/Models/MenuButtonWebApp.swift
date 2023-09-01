import Foundation
public final class MenuButtonWebApp: Codable, IMultiPartFromDataValueEncodable {
	///Type of the button, must be web_app
	public let type: String
	
	///Text on the button
	public let text: String
	
	///Description of the Web App that will be launched when the user presses the button. The Web App will be able to send an arbitrary message on behalf of the user using the method answerWebAppQuery.
	public let webApp: WebAppInfo

	public init(
		type: String,
		text: String,
		webApp: WebAppInfo
	) {
		self.type = type
		self.text = text
		self.webApp = webApp
	}

	private enum CodingKeys: String, CodingKey {
		case type
		case text
		case webApp = "web_app"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.type.self, forKey: .type)
		try container.encode(self.text.self, forKey: .text)
		try container.encode(self.webApp.self, forKey: .webApp)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try container.decode(String.self, forKey: .type)
		self.text = try container.decode(String.self, forKey: .text)
		self.webApp = try container.decode(WebAppInfo.self, forKey: .webApp)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
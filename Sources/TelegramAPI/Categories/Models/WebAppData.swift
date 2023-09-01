import Foundation
public final class WebAppData: Codable, IMultiPartFromDataValueEncodable {
	///The data. Be aware that a bad client can send arbitrary data in this field.
	public let data: String
	
	///Text of the web_app keyboard button from which the Web App was opened. Be aware that a bad client can send arbitrary data in this field.
	public let buttonText: String

	public init(
		data: String,
		buttonText: String
	) {
		self.data = data
		self.buttonText = buttonText
	}

	private enum CodingKeys: String, CodingKey {
		case data
		case buttonText = "button_text"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.data.self, forKey: .data)
		try container.encode(self.buttonText.self, forKey: .buttonText)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.data = try container.decode(String.self, forKey: .data)
		self.buttonText = try container.decode(String.self, forKey: .buttonText)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
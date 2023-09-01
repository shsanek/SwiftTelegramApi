import Foundation
public final class WriteAccessAllowed: Codable, IMultiPartFromDataValueEncodable {
	///Optional. Name of the Web App which was launched from a link
	public let webAppName: String?

	public init(
		webAppName: String? = nil
	) {
		self.webAppName = webAppName
	}

	private enum CodingKeys: String, CodingKey {
		case webAppName = "web_app_name"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(self.webAppName.self, forKey: .webAppName)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.webAppName = try container.decodeIfPresent(String.self, forKey: .webAppName)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
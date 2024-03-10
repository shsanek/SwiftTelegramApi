import Foundation
public final class WebAppInfo: Codable, IMultiPartFromDataValueEncodable {
	///An HTTPS URL of a Web App to be opened with additional data as specified in Initializing Web Apps
	public let url: String

	public init(
		url: String
	) {
		self.url = url
	}

	private enum CodingKeys: String, CodingKey {
		case url
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.url.self, forKey: .url)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.url = try container.decode(String.self, forKey: .url)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
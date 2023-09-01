import Foundation
public final class InputMessageContent: Codable, IMultiPartFromDataValueEncodable {
	

	public init(
	
	) {
	
	}

	

	public func encode(to encoder: Encoder) throws {}

	public init(from decoder: Decoder) throws {}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
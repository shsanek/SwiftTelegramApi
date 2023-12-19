import Foundation

extension TelegramAPI {
    /// Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
    public func getFile(_ input: GetFileInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<File>) -> Void) {
        self.requester.request("getFile", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }
}

//Input model for request getFile
import Foundation
public final class GetFileInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. File identifier to get information about
	public let fileId: String

	public init(
		fileId: String
	) {
		self.fileId = fileId
	}

	private enum CodingKeys: String, CodingKey {
		case fileId = "file_id"
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.fileId.self, forKey: .fileId)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.fileId = try container.decode(String.self, forKey: .fileId)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
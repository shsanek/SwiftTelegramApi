import Foundation
public final class MaskPosition: Codable, IMultiPartFromDataValueEncodable {
	///The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
	public let point: String
	
	///Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
	public let xShift: TelegramFloat
	
	///Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
	public let yShift: TelegramFloat
	
	///Mask scaling coefficient. For example, 2.0 means double size.
	public let scale: TelegramFloat

	public init(
		point: String,
		xShift: TelegramFloat,
		yShift: TelegramFloat,
		scale: TelegramFloat
	) {
		self.point = point
		self.xShift = xShift
		self.yShift = yShift
		self.scale = scale
	}

	private enum CodingKeys: String, CodingKey {
		case point
		case xShift = "x_shift"
		case yShift = "y_shift"
		case scale
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.point.self, forKey: .point)
		try container.encode(self.xShift.self, forKey: .xShift)
		try container.encode(self.yShift.self, forKey: .yShift)
		try container.encode(self.scale.self, forKey: .scale)
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.point = try container.decode(String.self, forKey: .point)
		self.xShift = try container.decode(TelegramFloat.self, forKey: .xShift)
		self.yShift = try container.decode(TelegramFloat.self, forKey: .yShift)
		self.scale = try container.decode(TelegramFloat.self, forKey: .scale)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
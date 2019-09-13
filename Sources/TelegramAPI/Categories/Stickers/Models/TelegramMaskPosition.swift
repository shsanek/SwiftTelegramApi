//
//  TelegramMaskPosition.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object describes the position on faces where a mask should be placed by default.
public struct TelegramMaskPosition
{

	///The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
	public let point: String

	///Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
	public let xShift: TelegramFloat

	///Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
	public let yShift: TelegramFloat

	///Mask scaling coefficient. For example, 2.0 means double size.
	public let scale: TelegramFloat

	public init(point: String,
                xShift: TelegramFloat,
                yShift: TelegramFloat,
                scale: TelegramFloat)
	{
		self.point = point
		self.xShift = xShift
		self.yShift = yShift
		self.scale = scale
	}

}

extension TelegramMaskPosition: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case point
		case xShift = "x_shift"
		case yShift = "y_shift"
		case scale
	}

}
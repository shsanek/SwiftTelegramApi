//
//  TelegramGameHighScore.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents one row of the high scores table for a game.
public struct TelegramGameHighScore
{

	///Position in high score table for the game
	public let position: TelegramInteger

	///User
	public let user: TelegramUser

	///Score
	public let score: TelegramInteger

	public init(position: TelegramInteger,
                user: TelegramUser,
                score: TelegramInteger)
	{
		self.position = position
		self.user = user
		self.score = score
	}

}

extension TelegramGameHighScore: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case position
		case user
		case score
	}

}
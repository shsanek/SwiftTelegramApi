//
//  TelegramUpdate.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

///This object represents an incoming update.At most one of the optional parameters can be present in any given update.
public struct TelegramUpdate
{

	///The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you’re using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
	public let updateId: TelegramInteger

	///Optional. New incoming message of any kind — text, photo, sticker, etc.
	public let message: TelegramMessage?

	///Optional. New version of a message that is known to the bot and was edited
	public let editedMessage: TelegramMessage?

	///Optional. New incoming channel post of any kind — text, photo, sticker, etc.
	public let channelPost: TelegramMessage?

	///Optional. New version of a channel post that is known to the bot and was edited
	public let editedChannelPost: TelegramMessage?

	///Optional. New incoming inline query
	public let inlineQuery: TelegramInlineQuery?

	///Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
	public let chosenInlineResult: TelegramChosenInlineResult?

	///Optional. New incoming callback query
	public let callbackQuery: TelegramCallbackQuery?

	///Optional. New incoming shipping query. Only for invoices with flexible price
	public let shippingQuery: TelegramShippingQuery?

	///Optional. New incoming pre-checkout query. Contains full information about checkout
	public let preCheckoutQuery: TelegramPreCheckoutQuery?

	///Optional. New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot
	public let poll: TelegramPoll?

	public init(updateId: TelegramInteger,
                message: TelegramMessage? = nil,
                editedMessage: TelegramMessage? = nil,
                channelPost: TelegramMessage? = nil,
                editedChannelPost: TelegramMessage? = nil,
                inlineQuery: TelegramInlineQuery? = nil,
                chosenInlineResult: TelegramChosenInlineResult? = nil,
                callbackQuery: TelegramCallbackQuery? = nil,
                shippingQuery: TelegramShippingQuery? = nil,
                preCheckoutQuery: TelegramPreCheckoutQuery? = nil,
                poll: TelegramPoll? = nil)
	{
		self.updateId = updateId
		self.message = message
		self.editedMessage = editedMessage
		self.channelPost = channelPost
		self.editedChannelPost = editedChannelPost
		self.inlineQuery = inlineQuery
		self.chosenInlineResult = chosenInlineResult
		self.callbackQuery = callbackQuery
		self.shippingQuery = shippingQuery
		self.preCheckoutQuery = preCheckoutQuery
		self.poll = poll
	}

}

extension TelegramUpdate: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case updateId = "update_id"
		case message
		case editedMessage = "edited_message"
		case channelPost = "channel_post"
		case editedChannelPost = "edited_channel_post"
		case inlineQuery = "inline_query"
		case chosenInlineResult = "chosen_inline_result"
		case callbackQuery = "callback_query"
		case shippingQuery = "shipping_query"
		case preCheckoutQuery = "pre_checkout_query"
		case poll
	}

}
//
//  TelegramAPI+SendInvoice.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 13.09.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

extension TelegramAPI
{

/// Use this method to send invoices. On success, the sent Message is returned.
	public func sendInvoice(_ input: TelegramSendInvoiceInput, completionHandler: @escaping (TelegramResult<TelegramMessage>) -> Void)
	{
		self.requester.request("sendInvoice", object: input, completion: completionHandler)
	}

}


public struct TelegramSendInvoiceInput
{

	///Unique identifier for the target private chat
	public let chatId: TelegramInteger

	///Product name, 1-32 characters
	public let title: String

	///Product description, 1-255 characters
	public let description: String

	///Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
	public let payload: String

	///Payments provider token, obtained via Botfather
	public let providerToken: String

	///Unique deep-linking parameter that can be used to generate this invoice when used as a start parameter
	public let startParameter: String

	///Three-letter ISO 4217 currency code, see more on currencies
	public let currency: String

	///Price breakdown, a list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
	public let prices: [TelegramLabeledPrice]

	///JSON-encoded data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
	public let providerData: String?

	///URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
	public let photoUrl: String?

	///Photo size
	public let photoSize: TelegramInteger?

	///Photo width
	public let photoWidth: TelegramInteger?

	///Photo height
	public let photoHeight: TelegramInteger?

	///Pass True, if you require the user&#39;s full name to complete the order
	public let needName: Bool?

	///Pass True, if you require the user&#39;s phone number to complete the order
	public let needPhoneNumber: Bool?

	///Pass True, if you require the user&#39;s email address to complete the order
	public let needEmail: Bool?

	///Pass True, if you require the user&#39;s shipping address to complete the order
	public let needShippingAddress: Bool?

	///Pass True, if user&#39;s phone number should be sent to provider
	public let sendPhoneNumberToProvider: Bool?

	///Pass True, if user&#39;s email address should be sent to provider
	public let sendEmailToProvider: Bool?

	///Pass True, if the final price depends on the shipping method
	public let isFlexible: Bool?

	///Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?

	///If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?

	///A JSON-serialized object for an inline keyboard. If empty, one &#39;Pay total price&#39; button will be shown. If not empty, the first button must be a Pay button.
	public let replyMarkup: TelegramInlineKeyboardMarkup?

	public init(chatId: TelegramInteger,
                title: String,
                description: String,
                payload: String,
                providerToken: String,
                startParameter: String,
                currency: String,
                prices: [TelegramLabeledPrice],
                providerData: String? = nil,
                photoUrl: String? = nil,
                photoSize: TelegramInteger? = nil,
                photoWidth: TelegramInteger? = nil,
                photoHeight: TelegramInteger? = nil,
                needName: Bool? = nil,
                needPhoneNumber: Bool? = nil,
                needEmail: Bool? = nil,
                needShippingAddress: Bool? = nil,
                sendPhoneNumberToProvider: Bool? = nil,
                sendEmailToProvider: Bool? = nil,
                isFlexible: Bool? = nil,
                disableNotification: Bool? = nil,
                replyToMessageId: TelegramInteger? = nil,
                replyMarkup: TelegramInlineKeyboardMarkup? = nil)
	{
		self.chatId = chatId
		self.title = title
		self.description = description
		self.payload = payload
		self.providerToken = providerToken
		self.startParameter = startParameter
		self.currency = currency
		self.prices = prices
		self.providerData = providerData
		self.photoUrl = photoUrl
		self.photoSize = photoSize
		self.photoWidth = photoWidth
		self.photoHeight = photoHeight
		self.needName = needName
		self.needPhoneNumber = needPhoneNumber
		self.needEmail = needEmail
		self.needShippingAddress = needShippingAddress
		self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
		self.sendEmailToProvider = sendEmailToProvider
		self.isFlexible = isFlexible
		self.disableNotification = disableNotification
		self.replyToMessageId = replyToMessageId
		self.replyMarkup = replyMarkup
	}

}

extension TelegramSendInvoiceInput: Codable
{

	private enum CodingKeys: String, CodingKey
	{
		case chatId = "chat_id"
		case title
		case description
		case payload
		case providerToken = "provider_token"
		case startParameter = "start_parameter"
		case currency
		case prices
		case providerData = "provider_data"
		case photoUrl = "photo_url"
		case photoSize = "photo_size"
		case photoWidth = "photo_width"
		case photoHeight = "photo_height"
		case needName = "need_name"
		case needPhoneNumber = "need_phone_number"
		case needEmail = "need_email"
		case needShippingAddress = "need_shipping_address"
		case sendPhoneNumberToProvider = "send_phone_number_to_provider"
		case sendEmailToProvider = "send_email_to_provider"
		case isFlexible = "is_flexible"
		case disableNotification = "disable_notification"
		case replyToMessageId = "reply_to_message_id"
		case replyMarkup = "reply_markup"
	}

}

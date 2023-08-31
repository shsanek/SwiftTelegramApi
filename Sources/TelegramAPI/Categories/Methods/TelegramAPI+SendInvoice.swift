extension TelegramAPI {
    /// Use this method to send invoices. On success, the sent Message is returned.
    public func sendInvoice(_ input: SendInvoiceInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendInvoice", object: input, completion: completionHandler)
    }
}

//Input model for request sendInvoice
public final class SendInvoiceInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Product name, 1-32 characters
	public let title: String
	
	///Yes. Product description, 1-255 characters
	public let description: String
	
	///Yes. Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
	public let payload: String
	
	///Yes. Payment provider token, obtained via @BotFather
	public let providerToken: String
	
	///Yes. Three-letter ISO 4217 currency code, see more on currencies
	public let currency: String
	
	///Yes. Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
	public let prices: [LabeledPrice]
	
	///Optional. The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0
	public let maxTipAmount: TelegramInteger?
	
	///Optional. A JSON-serialized array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
	public let suggestedTipAmounts: [TelegramInteger]?
	
	///Optional. Unique deep-linking parameter. If left empty, forwarded copies of the sent message will have a Pay button, allowing multiple users to pay directly from the forwarded message, using the same invoice. If non-empty, forwarded copies of the sent message will have a URL button with a deep link to the bot (instead of a Pay button), with the value used as the start parameter
	public let startParameter: String?
	
	///Optional. JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
	public let providerData: String?
	
	///Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
	public let photoUrl: String?
	
	///Optional. Photo size in bytes
	public let photoSize: TelegramInteger?
	
	///Optional. Photo width
	public let photoWidth: TelegramInteger?
	
	///Optional. Photo height
	public let photoHeight: TelegramInteger?
	
	///Optional. Pass True if you require the user's full name to complete the order
	public let needName: Bool?
	
	///Optional. Pass True if you require the user's phone number to complete the order
	public let needPhoneNumber: Bool?
	
	///Optional. Pass True if you require the user's email address to complete the order
	public let needEmail: Bool?
	
	///Optional. Pass True if you require the user's shipping address to complete the order
	public let needShippingAddress: Bool?
	
	///Optional. Pass True if the user's phone number should be sent to provider
	public let sendPhoneNumberToProvider: Bool?
	
	///Optional. Pass True if the user's email address should be sent to provider
	public let sendEmailToProvider: Bool?
	
	///Optional. Pass True if the final price depends on the shipping method
	public let isFlexible: Bool?
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the sent message from forwarding and saving
	public let protectContent: Bool?
	
	///Optional. If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?
	
	///Optional. Pass True if the message should be sent even if the specified replied-to message is not found
	public let allowSendingWithoutReply: Bool?
	
	///Optional. A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
	public let replyMarkup: InlineKeyboardMarkup?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		title: String,
		description: String,
		payload: String,
		providerToken: String,
		currency: String,
		prices: [LabeledPrice],
		maxTipAmount: TelegramInteger? = nil,
		suggestedTipAmounts: [TelegramInteger]? = nil,
		startParameter: String? = nil,
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
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: InlineKeyboardMarkup? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.title = title
		self.description = description
		self.payload = payload
		self.providerToken = providerToken
		self.currency = currency
		self.prices = prices
		self.maxTipAmount = maxTipAmount
		self.suggestedTipAmounts = suggestedTipAmounts
		self.startParameter = startParameter
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
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) {
		encoder.append("chat_id", object: self.chatId)
		encoder.append("message_thread_id", object: self.messageThreadId)
		encoder.append("title", object: self.title)
		encoder.append("description", object: self.description)
		encoder.append("payload", object: self.payload)
		encoder.append("provider_token", object: self.providerToken)
		encoder.append("currency", object: self.currency)
		encoder.append("prices", object: self.prices)
		encoder.append("max_tip_amount", object: self.maxTipAmount)
		encoder.append("suggested_tip_amounts", object: self.suggestedTipAmounts)
		encoder.append("start_parameter", object: self.startParameter)
		encoder.append("provider_data", object: self.providerData)
		encoder.append("photo_url", object: self.photoUrl)
		encoder.append("photo_size", object: self.photoSize)
		encoder.append("photo_width", object: self.photoWidth)
		encoder.append("photo_height", object: self.photoHeight)
		encoder.append("need_name", object: self.needName)
		encoder.append("need_phone_number", object: self.needPhoneNumber)
		encoder.append("need_email", object: self.needEmail)
		encoder.append("need_shipping_address", object: self.needShippingAddress)
		encoder.append("send_phone_number_to_provider", object: self.sendPhoneNumberToProvider)
		encoder.append("send_email_to_provider", object: self.sendEmailToProvider)
		encoder.append("is_flexible", object: self.isFlexible)
		encoder.append("disable_notification", object: self.disableNotification)
		encoder.append("protect_content", object: self.protectContent)
		encoder.append("reply_to_message_id", object: self.replyToMessageId)
		encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		encoder.append("reply_markup", object: self.replyMarkup)
	}
}
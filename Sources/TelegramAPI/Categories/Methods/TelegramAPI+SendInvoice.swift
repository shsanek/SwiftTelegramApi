extension TelegramAPI {
    /// Use this method to send invoices. On success, the sent Message is returned.
    public func sendInvoice(_ input: SendInvoiceInput, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendInvoice", object: input, completion: completionHandler)
    }
}

//Input model for request sendInvoice
public final class SendInvoiceInput: IMultiPartFromDataEncodable {
	///Yes
	public let chatId: TelegramIdentifierContainer
	
	///Optional
	public let messageThreadId: TelegramInteger?
	
	///Yes
	public let title: String
	
	///Yes
	public let description: String
	
	///Yes
	public let payload: String
	
	///Yes
	public let providerToken: String
	
	///Yes
	public let currency: String
	
	///Yes
	public let prices: [LabeledPrice]
	
	///Optional
	public let maxTipAmount: TelegramInteger?
	
	///Optional
	public let suggestedTipAmounts: [TelegramInteger]?
	
	///Optional
	public let startParameter: String?
	
	///Optional
	public let providerData: String?
	
	///Optional
	public let photoUrl: String?
	
	///Optional
	public let photoSize: TelegramInteger?
	
	///Optional
	public let photoWidth: TelegramInteger?
	
	///Optional
	public let photoHeight: TelegramInteger?
	
	///Optional
	public let needName: Bool?
	
	///Optional
	public let needPhoneNumber: Bool?
	
	///Optional
	public let needEmail: Bool?
	
	///Optional
	public let needShippingAddress: Bool?
	
	///Optional
	public let sendPhoneNumberToProvider: Bool?
	
	///Optional
	public let sendEmailToProvider: Bool?
	
	///Optional
	public let isFlexible: Bool?
	
	///Optional
	public let disableNotification: Bool?
	
	///Optional
	public let protectContent: Bool?
	
	///Optional
	public let replyToMessageId: TelegramInteger?
	
	///Optional
	public let allowSendingWithoutReply: Bool?
	
	///Optional
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
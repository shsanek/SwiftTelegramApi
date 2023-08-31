extension TelegramAPI {
    /// Use this method to create a link for an invoice. Returns the created invoice link as String on success.
    public func createInvoiceLink(_ input: CreateInvoiceLinkInput, completionHandler: @escaping (TelegramResult<String>) -> Void) {
        self.requester.request("createInvoiceLink", object: input, completion: completionHandler)
    }
}

//Input model for request createInvoiceLink
public final class CreateInvoiceLinkInput: Encodable {
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

	public init(
		title: String,
		description: String,
		payload: String,
		providerToken: String,
		currency: String,
		prices: [LabeledPrice],
		maxTipAmount: TelegramInteger? = nil,
		suggestedTipAmounts: [TelegramInteger]? = nil,
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
		isFlexible: Bool? = nil
	) {
		self.title = title
		self.description = description
		self.payload = payload
		self.providerToken = providerToken
		self.currency = currency
		self.prices = prices
		self.maxTipAmount = maxTipAmount
		self.suggestedTipAmounts = suggestedTipAmounts
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
	}

	private enum CodingKeys: String, CodingKey {
		case title
		case description
		case payload
		case providerToken = "provider_token"
		case currency
		case prices
		case maxTipAmount = "max_tip_amount"
		case suggestedTipAmounts = "suggested_tip_amounts"
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
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.title.self, forKey: .title)
		try container.encode(self.description.self, forKey: .description)
		try container.encode(self.payload.self, forKey: .payload)
		try container.encode(self.providerToken.self, forKey: .providerToken)
		try container.encode(self.currency.self, forKey: .currency)
		try container.encode(self.prices.self, forKey: .prices)
		try container.encodeIfPresent(self.maxTipAmount.self, forKey: .maxTipAmount)
		try container.encodeIfPresent(self.suggestedTipAmounts.self, forKey: .suggestedTipAmounts)
		try container.encodeIfPresent(self.providerData.self, forKey: .providerData)
		try container.encodeIfPresent(self.photoUrl.self, forKey: .photoUrl)
		try container.encodeIfPresent(self.photoSize.self, forKey: .photoSize)
		try container.encodeIfPresent(self.photoWidth.self, forKey: .photoWidth)
		try container.encodeIfPresent(self.photoHeight.self, forKey: .photoHeight)
		try container.encodeIfPresent(self.needName.self, forKey: .needName)
		try container.encodeIfPresent(self.needPhoneNumber.self, forKey: .needPhoneNumber)
		try container.encodeIfPresent(self.needEmail.self, forKey: .needEmail)
		try container.encodeIfPresent(self.needShippingAddress.self, forKey: .needShippingAddress)
		try container.encodeIfPresent(self.sendPhoneNumberToProvider.self, forKey: .sendPhoneNumberToProvider)
		try container.encodeIfPresent(self.sendEmailToProvider.self, forKey: .sendEmailToProvider)
		try container.encodeIfPresent(self.isFlexible.self, forKey: .isFlexible)
	}
}
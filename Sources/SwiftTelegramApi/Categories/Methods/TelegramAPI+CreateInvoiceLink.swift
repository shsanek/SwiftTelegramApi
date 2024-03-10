import Foundation

extension TelegramAPI {
    /// Use this method to create a link for an invoice. Returns the created invoice link as String on success.
    public func createInvoiceLink(_ input: CreateInvoiceLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<String>) -> Void) {
        self.requester.request("createInvoiceLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @discardableResult
    public func createInvoiceLink(_ input: CreateInvoiceLinkInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> String {
        try await self.requester.request("createInvoiceLink", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request createInvoiceLink
import Foundation
public final class CreateInvoiceLinkInput: Codable, IMultiPartFromDataValueEncodable {
	///Yes. Product name, 1-32 characters
	public let title: String
	
	///Yes. Product description, 1-255 characters
	public let description: String
	
	///Yes. Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
	public let payload: String
	
	///Yes. Payment provider token, obtained via BotFather
	public let providerToken: String
	
	///Yes. Three-letter ISO 4217 currency code, see more on currencies
	public let currency: String
	
	///Yes. Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
	public let prices: [LabeledPrice]
	
	///Optional. The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0
	public let maxTipAmount: TelegramInteger?
	
	///Optional. A JSON-serialized array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed max_tip_amount.
	public let suggestedTipAmounts: [TelegramInteger]?
	
	///Optional. JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
	public let providerData: String?
	
	///Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
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
	
	///Optional. Pass True if the user's phone number should be sent to the provider
	public let sendPhoneNumberToProvider: Bool?
	
	///Optional. Pass True if the user's email address should be sent to the provider
	public let sendEmailToProvider: Bool?
	
	///Optional. Pass True if the final price depends on the shipping method
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

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.title = try container.decode(String.self, forKey: .title)
		self.description = try container.decode(String.self, forKey: .description)
		self.payload = try container.decode(String.self, forKey: .payload)
		self.providerToken = try container.decode(String.self, forKey: .providerToken)
		self.currency = try container.decode(String.self, forKey: .currency)
		self.prices = try container.decode([LabeledPrice].self, forKey: .prices)
		self.maxTipAmount = try container.decodeIfPresent(TelegramInteger.self, forKey: .maxTipAmount)
		self.suggestedTipAmounts = try container.decodeIfPresent([TelegramInteger].self, forKey: .suggestedTipAmounts)
		self.providerData = try container.decodeIfPresent(String.self, forKey: .providerData)
		self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
		self.photoSize = try container.decodeIfPresent(TelegramInteger.self, forKey: .photoSize)
		self.photoWidth = try container.decodeIfPresent(TelegramInteger.self, forKey: .photoWidth)
		self.photoHeight = try container.decodeIfPresent(TelegramInteger.self, forKey: .photoHeight)
		self.needName = try container.decodeIfPresent(Bool.self, forKey: .needName)
		self.needPhoneNumber = try container.decodeIfPresent(Bool.self, forKey: .needPhoneNumber)
		self.needEmail = try container.decodeIfPresent(Bool.self, forKey: .needEmail)
		self.needShippingAddress = try container.decodeIfPresent(Bool.self, forKey: .needShippingAddress)
		self.sendPhoneNumberToProvider = try container.decodeIfPresent(Bool.self, forKey: .sendPhoneNumberToProvider)
		self.sendEmailToProvider = try container.decodeIfPresent(Bool.self, forKey: .sendEmailToProvider)
		self.isFlexible = try container.decodeIfPresent(Bool.self, forKey: .isFlexible)
	}

	func multipartFromDataValue() throws -> MultiPartFromDataContainer {
	    try MultiPartFromDataContainer(object: self)
	}
}
import Foundation

extension TelegramAPI {
    /// Use this method to send point on the map. On success, the sent Message is returned.
    public func sendLocation(_ input: SendLocationInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60, completionHandler: @escaping (TelegramResult<Message>) -> Void) {
        self.requester.request("sendLocation", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval, completion: completionHandler)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func sendLocation(_ input: SendLocationInput, numberOfAttempts: Int = 1, timeoutInterval: TimeInterval = 60) async throws -> Message {
        try await self.requester.request("sendLocation", object: input, numberOfAttempts: numberOfAttempts, timeoutInterval: timeoutInterval)
    }
}

//Input model for request sendLocation
public final class SendLocationInput: IMultiPartFromDataEncodable {
	///Yes. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	public let chatId: TelegramIdentifierContainer
	
	///Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
	public let messageThreadId: TelegramInteger?
	
	///Yes. Latitude of the location
	public let latitude: TelegramFloat
	
	///Yes. Longitude of the location
	public let longitude: TelegramFloat
	
	///Optional. The radius of uncertainty for the location, measured in meters; 0-1500
	public let horizontalAccuracy: TelegramFloat?
	
	///Optional. Period in seconds for which the location will be updated (see Live Locations, should be between 60 and 86400.
	public let livePeriod: TelegramInteger?
	
	///Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
	public let heading: TelegramInteger?
	
	///Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
	public let proximityAlertRadius: TelegramInteger?
	
	///Optional. Sends the message silently. Users will receive a notification with no sound.
	public let disableNotification: Bool?
	
	///Optional. Protects the contents of the sent message from forwarding and saving
	public let protectContent: Bool?
	
	///Optional. If the message is a reply, ID of the original message
	public let replyToMessageId: TelegramInteger?
	
	///Optional. Pass True if the message should be sent even if the specified replied-to message is not found
	public let allowSendingWithoutReply: Bool?
	
	///Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	public let replyMarkup: TelegramMarkupContainer?

	public init(
		chatId: TelegramIdentifierContainer,
		messageThreadId: TelegramInteger? = nil,
		latitude: TelegramFloat,
		longitude: TelegramFloat,
		horizontalAccuracy: TelegramFloat? = nil,
		livePeriod: TelegramInteger? = nil,
		heading: TelegramInteger? = nil,
		proximityAlertRadius: TelegramInteger? = nil,
		disableNotification: Bool? = nil,
		protectContent: Bool? = nil,
		replyToMessageId: TelegramInteger? = nil,
		allowSendingWithoutReply: Bool? = nil,
		replyMarkup: TelegramMarkupContainer? = nil
	) {
		self.chatId = chatId
		self.messageThreadId = messageThreadId
		self.latitude = latitude
		self.longitude = longitude
		self.horizontalAccuracy = horizontalAccuracy
		self.livePeriod = livePeriod
		self.heading = heading
		self.proximityAlertRadius = proximityAlertRadius
		self.disableNotification = disableNotification
		self.protectContent = protectContent
		self.replyToMessageId = replyToMessageId
		self.allowSendingWithoutReply = allowSendingWithoutReply
		self.replyMarkup = replyMarkup
	}

	func encode(_ encoder: MultiPartFromDataEncoder) throws {
		try encoder.append("chat_id", object: self.chatId)
		try encoder.append("message_thread_id", object: self.messageThreadId)
		try encoder.append("latitude", object: self.latitude)
		try encoder.append("longitude", object: self.longitude)
		try encoder.append("horizontal_accuracy", object: self.horizontalAccuracy)
		try encoder.append("live_period", object: self.livePeriod)
		try encoder.append("heading", object: self.heading)
		try encoder.append("proximity_alert_radius", object: self.proximityAlertRadius)
		try encoder.append("disable_notification", object: self.disableNotification)
		try encoder.append("protect_content", object: self.protectContent)
		try encoder.append("reply_to_message_id", object: self.replyToMessageId)
		try encoder.append("allow_sending_without_reply", object: self.allowSendingWithoutReply)
		try encoder.append("reply_markup", object: self.replyMarkup)
	}
}
//
//  main.swift
//  TelegramAPI
//
//  Created by Alex Shipin on 11.08.2019.
//  Copyright © 2019 Alexander Shipin. All rights reserved.
//

import Foundation

let api = TelegramAPI(token: "bot782260626:AAEIdzeNZdFHGJmJprqmoDFAFisu3M31FAw")

let message = TelegramSendMessageInput(chatId: .integer(identifier: 148422417),
                                       text: "SWIFT")

let semaphore = DispatchSemaphore(value: 0)
api.sendMessage(message) { _ in
    semaphore.signal()
}
_ = semaphore.wait(timeout: .distantFuture)
print("end programm")

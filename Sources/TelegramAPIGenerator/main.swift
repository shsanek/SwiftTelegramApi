import Foundation

extension String {
    var upFirst: String {
        String(self.first!).uppercased() + String(self.dropFirst())
    }
}
func convertKey(_ key: String) -> String {
    let elements = key.components(separatedBy: "_")
    let editElements = Array(elements.dropFirst()).map {
        $0.upFirst
    }
    return elements[0] + editElements.joined()
}

struct Element: Codable {
    let name: String
    let description: String
    let properties: [Property]

    var isMethod: Bool {
        name.upFirst != name
    }

    struct Property: Codable {
        let name: String
        let type: String
        let description: String

        var swiftName: String {
            convertKey(name)
        }

        var isInputFile: Bool {
            ["TelegramIdentifierContainer", "TelegramInputFile", "InputSticker"].contains(subtype)
        }

        var subtype: String {
            let arrayPrefix = "Array of "
            var base = type
            while base.hasPrefix(arrayPrefix) {
                base = String(base.dropFirst(arrayPrefix.count))
            }
            if base == "Integer" {
                base = "TelegramInteger"
            }
            if base == "Float" {
                base = "TelegramFloat"
            }
            if base == "Boolean" {
                base = "Bool"
            }
            if base == "Integer or String" {
                base = "TelegramIdentifierContainer"
            }
            if base == "True" {
                base = "Bool"
            }
            if base == "InputFile or String" {
                base = "TelegramInputFileContainer"
            }
            if base == "InputFile" {
                base = "TelegramInputFile"
            }
            if base == "Float number" {
                base = "TelegramFloat"
            }
            if base == "InlineKeyboardMarkup or ReplyKeyboardMarkup or ReplyKeyboardRemove or ForceReply" {
                base = "TelegramMarkupContainer"
            }
            if base == "InputMediaAudio, InputMediaDocument, InputMediaPhoto and InputMediaVideo" {
                base = "TelegramInputMediaContainer"
            }
            return base
        }

        func calculate(baseType: String) -> String {
            let arrayPrefix = "Array of "
            var base = baseType
            var arrayCount = 0
            while base.hasPrefix(arrayPrefix) {
                arrayCount += 1
                base = String(base.dropFirst(arrayPrefix.count))
            }
            base = subtype
            for _ in 0..<arrayCount {
                base = "[\(base)]"
            }
            return base
        }

        var baseType: String {
            calculate(baseType: type)
        }


        var swiftType: String {
            return isOptional ? "\(baseType)?" : baseType
        }

        var isOptional: Bool {
            description.hasPrefix("Optional")
        }
    }
}

func getResultFrom(description: String, allNames: [String]) -> String {
    var additionalResultMap: [String: String] = [
        "True": "Bool",
        "Int": "TelegramInteger",
        "String": "String"
    ]
    allNames.forEach { name in
        additionalResultMap[name] = name
    }
    let variations = [
        "Returns %T on success.",
        "%T on success",
        "Returns a %T object on success.",
        "On success, returns a %T object.",
        "Returns basic information about the bot in form of a %T object.",
        "On success, the sent %T is returned.",
        "Returns the %T of the sent message on success.",
        "Returns a %T object.",
        "On success, a %T object is returned.",
        "invite link as %T on success.",
        "invite link as %T object.",
        "invite link as a %T object.",
        "Returns information about the created topic as a %T object.",
        "%T is returned"
    ]
    let arrayVariation = [
        "Returns an Array of %T objects",
        "On success, an array of %T that were sent is returned."
    ]
    for container in additionalResultMap {
        for v in variations {
            let replace = v.replacingOccurrences(of: "%T", with: container.key)
            if description.contains(replace) {
                return container.value
            }
        }
        for v in arrayVariation {
            let replace = v.replacingOccurrences(of: "%T", with: container.key)
            if description.contains(replace) {
                return "[\(container.value)]"
            }
        }
        for v in arrayVariation {
            let replace = v.replacingOccurrences(of: "%T", with: container.key + "s")
            if description.contains(replace) {
                return "[\(container.value)]"
            }
        }
    }
    fatalError("")
}

func generateModel(element: Element, name: String, allNames: [String], isInput: Bool = false) -> String {
    let properties = element.properties.map {
        "///\($0.description)\npublic let \($0.swiftName): \($0.swiftType)"
    }
    let codingKeys = element.properties.map {
        if $0.name == convertKey($0.name) {
            return "case \($0.name)"
        } else {
            return "case \($0.swiftName) = \"\($0.name)\""
        }
    }
    let decodes =  ["let container = try decoder.container(keyedBy: CodingKeys.self)"] + element.properties.map {
        if $0.isOptional {
            return "self.\($0.swiftName) = try container.decodeIfPresent(\($0.baseType).self, forKey: .\($0.swiftName))"
        } else {
            return "self.\($0.swiftName) = try container.decode(\($0.baseType).self, forKey: .\($0.swiftName))"
        }
    }

    let encodes = ["var container = encoder.container(keyedBy: CodingKeys.self)"] + element.properties.map {
        if $0.isOptional {
            return "try container.encodeIfPresent(self.\($0.swiftName).self, forKey: .\($0.swiftName))"
        } else {
            return "try container.encode(self.\($0.swiftName).self, forKey: .\($0.swiftName))"
        }
    }

    let multipartEncodes = element.properties.map {
        "try encoder.append(\"\($0.name)\", object: self.\($0.swiftName))"
    }

    let initInput = element.properties.map {
        "\($0.swiftName): \($0.swiftType)\($0.isOptional ? " = nil" : "")"
    }

    let initProp = element.properties.map {
        "self.\($0.swiftName) = \($0.swiftName)"
    }

    let propertiesBlock = properties.joined(0, separator: "\n\n")
    var codingKeysBlock = "private enum CodingKeys: String, CodingKey {\n\(codingKeys.joined(1, separator: "\n"))\n}"
    var encodeBlock = "public func encode(to encoder: Encoder) throws {\n\(encodes.joined(1, separator: "\n"))\n}"
    var decodeBlock = "public init(from decoder: Decoder) throws {\n\(decodes.joined(1, separator: "\n"))\n}"
    let multipartEncodeBlock = "func encode(_ encoder: MultiPartFromDataEncoder) throws {\n\(multipartEncodes.joined(1, separator: "\n"))\n}"
    if properties.isEmpty {
        codingKeysBlock = ""
        encodeBlock = "public func encode(to encoder: Encoder) throws {}"
        decodeBlock = "public init(from decoder: Decoder) throws {}"
    }
    let attach = """
    func multipartFromDataValue() throws -> MultiPartFromDataContainer {
        try MultiPartFromDataContainer(object: self)
    }
    """
    if element.properties.contains(where: { $0.isInputFile }) && isInput {
        let initBlock = "public init(\n\(initInput.joined(1, separator: ",\n"))\n) {\n\(initProp.joined(1, separator: "\n"))\n}"
        let blocks = [propertiesBlock, initBlock, multipartEncodeBlock]
        return "public final class \(name): IMultiPartFromDataEncodable {\n\(blocks.joined(1, separator: "\n\n"))\n}"
    }
    let initBlock = "public init(\n\(initInput.joined(1, separator: ",\n"))\n) {\n\(initProp.joined(1, separator: "\n"))\n}"
    let blocks = [propertiesBlock, initBlock, codingKeysBlock, encodeBlock, decodeBlock, attach]
    return "import Foundation\npublic final class \(name): Codable, IMultiPartFromDataValueEncodable {\n\(blocks.joined(1, separator: "\n\n"))\n}"
}

extension Array where Element == String {
    func joined(_ tab: Int, separator: String) -> String {
        var tabString = ""
        for _ in 0..<tab { tabString += "\t" }
        return map { $0.components(separatedBy: "\n").map { tabString + $0 }.joined(separator: "\n") }.joined(separator: separator)
    }
}

func generateItemMethod(element: Element, allNames: [String]) -> String {
    let resultValue = getResultFrom(description: element.description, allNames: allNames)
    let inputValue = element.properties.isEmpty ? "EmptyObject" : "\(element.name.upFirst)Input"

    var body = """
    extension TelegramAPI {
        /// \(element.description)
        public func \(element.name)(_ input: \(inputValue), completionHandler: @escaping (TelegramResult<\(resultValue)>) -> Void) {
            self.requester.request("\(element.name)", object: input, completion: completionHandler)
        }
    }
    """
    if !element.properties.isEmpty {
        body += "\n\n//Input model for request \(element.name)\n\(generateModel(element: element, name: inputValue, allNames: allNames, isInput: true))"
    }
    return body
}

let inputPath = "/Users/alexandershipin/Documents/projects/SwiftTelegramApi/Sources/TelegramAPIGenerator/Input.txt"
let outputFolderPath = "/Users/alexandershipin/Documents/projects/SwiftTelegramApi/Sources/TelegramAPI/Categories"

@available(macOS 13.0, *)
func run() {
    let outURL = URL(filePath: outputFolderPath)
    let elements = try! JSONDecoder().decode(
        [Element].self,
        from: try! Data(contentsOf: URL(filePath: inputPath))
    ).filter { $0.name.components(separatedBy: " ").count == 1 }
    let allNames = elements.map { $0.name }
    var count = 0
    for element in elements {
        if element.name == "InputFile" {
            continue
        }
        count += 1
        if element.isMethod {
            let file = "TelegramAPI+\(element.name.upFirst).swift"
            let body = generateItemMethod(element: element, allNames: allNames)
            try! body.data(using: .utf8)!.write(to: outURL.appending(path: "/Methods/\(file)"))
        } else {
            let file = "\(element.name).swift"
            let body = generateModel(element: element, name: element.name, allNames: allNames)
            try! body.data(using: .utf8)!.write(to: outURL.appending(path: "/Models/\(file)"))
        }
    }

}

if #available(macOS 13.0, *) {
    run()
} else {
    // Fallback on earlier versions
}

// Returns \(Name) on success.
// Returns an Array of \(Name) objects
// Returns \(Name) on success.
// Returns a \(Name) object on success.

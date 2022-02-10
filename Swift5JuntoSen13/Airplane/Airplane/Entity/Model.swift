// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUsers { response in
//     if let users = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Users
struct Users: Codable {
    let results: [UserResult]?
}

// MARK: - Result
struct UserResult: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let dob, registered: Dob?
    let phone, cell: String?
    let picture: Picture?
    let nat: String?
}

// MARK: - Dob
struct Dob: Codable {
    let date: String?
    let age: Int?
}

// MARK: - ID
struct ID: Codable {
    let name: String?
    let value: JSONNull?
}

// MARK: - Location
struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    let coordinates: Coordinates
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCoordinates { response in
//     if let coordinates = response.result.value {
//       ...
//     }
//   }

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStreet { response in
//     if let street = response.result.value {
//       ...
//     }
//   }

// MARK: - Street
struct Street: Codable {
    let number: Int?
    let name: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTimezone { response in
//     if let timezone = response.result.value {
//       ...
//     }
//   }

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseLogin { response in
//     if let login = response.result.value {
//       ...
//     }
//   }

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseName { response in
//     if let name = response.result.value {
//       ...
//     }
//   }

// MARK: - Name
struct Name: Codable {
    let title, first, last: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePicture { response in
//     if let picture = response.result.value {
//       ...
//     }
//   }

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

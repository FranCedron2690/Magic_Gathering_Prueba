// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let magicCardModel = try? newJSONDecoder().decode(MagicCardModel.self, from: jsonData)

import Foundation

// MARK: - MagicCardModel
struct MagicCardModel: Codable {
    let cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    let name, manaCost: String
    let cmc: Int
    let colors: [Color]
    let colorIdentity: [ColorIdentity]
    let type: String
    let types: [TypeElement]
    let subtypes: [String]?
    let rarity: Rarity
    let cardSet: Set
    let setName: SetName
    let text: String?
    let artist, number: String
    let power, toughness: String?
    let layout: Layout
    let multiverseid: String?
    let imageURL: String?
    let variations: [String]?
    let foreignNames: [ForeignName]?
    let printings: [String]
    let originalText, originalType: String?
    let legalities: [LegalityElement]
    let id: String
    let flavor: String?
    let rulings: [Ruling]?
    let supertypes: [String]?

    enum CodingKeys: String, CodingKey {
        case name, manaCost, cmc, colors, colorIdentity, type, types, subtypes, rarity
        case cardSet = "set"
        case setName, text, artist, number, power, toughness, layout, multiverseid
        case imageURL = "imageUrl"
        case variations, foreignNames, printings, originalText, originalType, legalities, id, flavor, rulings, supertypes
    }
}

enum Set: String, Codable {
    case the10E = "10E"
}

enum ColorIdentity: String, Codable {
    case b = "B"
    case u = "U"
    case w = "W"
}

enum Color: String, Codable {
    case black = "Black"
    case blue = "Blue"
    case white = "White"
}

// MARK: - ForeignName
struct ForeignName: Codable {
    let name: String
    let text: String?
    let type: String
    let flavor: String?
    let imageURL: String
    let language: Language
    let multiverseid: Int

    enum CodingKeys: String, CodingKey {
        case name, text, type, flavor
        case imageURL = "imageUrl"
        case language, multiverseid
    }
}

enum Language: String, Codable {
    case chineseSimplified = "Chinese Simplified"
    case french = "French"
    case german = "German"
    case italian = "Italian"
    case japanese = "Japanese"
    case portugueseBrazil = "Portuguese (Brazil)"
    case russian = "Russian"
    case spanish = "Spanish"
}

enum Layout: String, Codable {
    case normal = "normal"
}

// MARK: - LegalityElement
struct LegalityElement: Codable {
    let format: Format
    let legality: LegalityEnum
}

enum Format: String, Codable {
    case brawl = "Brawl"
    case commander = "Commander"
    case duel = "Duel"
    case gladiator = "Gladiator"
    case historic = "Historic"
    case historicbrawl = "Historicbrawl"
    case legacy = "Legacy"
    case modern = "Modern"
    case pauper = "Pauper"
    case paupercommander = "Paupercommander"
    case penny = "Penny"
    case pioneer = "Pioneer"
    case premodern = "Premodern"
    case vintage = "Vintage"
}

enum LegalityEnum: String, Codable {
    case legal = "Legal"
    case restricted = "Restricted"
}

enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case uncommon = "Uncommon"
}

// MARK: - Ruling
struct Ruling: Codable {
    let date, text: String
}

enum SetName: String, Codable {
    case tenthEdition = "Tenth Edition"
}

enum TypeElement: String, Codable {
    case creature = "Creature"
    case enchantment = "Enchantment"
    case instant = "Instant"
    case sorcery = "Sorcery"
}

//
//  Vehicle.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit

/// Decodable vehicle object
struct Vehicle: Decodable {
    let brand, vehicleModel: String
    let distanceString: String?
    let addressID, doorsCount, id, placesCount, year: Int
    let fakeLatitude, fakeLongitude: Double
    let thumbnailURL: URL
    var thumbnailImage: UIImage? = nil
    let category: Category
    let fuelTypeCD: FuelType
    let gearsTypeCD: GearsType

    
    /// JSON data keys used by Decodable
    private enum CodingKeys: String, CodingKey {
        case addressID = "address_id"
        case brand
        case category
        case distanceString = "distance_string"
        case doorsCount = "doors_count"
        case fakeLatitude = "fake_latitude"
        case fakeLongitude = "fake_longitude"
        case fuelTypeCD = "fuel_type_cd"
        case gearsTypeCD = "gears_type_cd"
        case id
        case placesCount = "places_count"
        case thumbnailURL = "thumbnail_url"
        case vehicleModel = "vehicle_model"
        case year
    }
    
    /// Vehicle category
    enum Category: String, Decodable {
        case citadine = "CITADINE"
        case compacte = "COMPACTE"
        case confortEtFun = "CONFORT_ET_FUN"
        case electrique = "ELECTRIQUE"
        case familiale = "FAMILIALE"
        case utilitaireLeger = "UTILITAIRE_LEGER"
        case utilitaireLourd = "UTILITAIRE_LOURD"
        
        var readableString: String {
            switch self {
            case .citadine: return "Citadine"
            case .compacte: return "Compacte"
            case .confortEtFun: return "Confort et fun"
            case .electrique: return "Electrique"
            case .familiale: return "Familiale"
            case .utilitaireLeger: return "Utilitaire Léger"
            case .utilitaireLourd: return "Utilitaire Lourd"
            }
        }
    }
    
    /// Fuel type
    /// (note: only includes values present in provided JSON file)
    enum FuelType: Int, Decodable {
        case gasoline = 0
        case diesel = 1
        case electric = 2
        case hybrid = 4
        
        var readableString: String {
            switch self {
            case .gasoline: return "Essence"
            case .diesel: return "Diesel"
            case .electric: return "Électrique"
            case .hybrid: return "Hybrid"
            }
        }
    }
    
    /// Transmission type
    /// (note: only includes values present in provided JSON file)
    enum GearsType: Int, Decodable {
        case automatic = 0
        case manual = 1
        
        var readableString: String {
            switch self {
            case .manual: return "Manuelle"
            case .automatic: return "Automatique"
            }
        }
    }
}

/// Struct wrapping a decodable Vehicle object
struct VehicleWrapper: Decodable {
    let vehicles: [Vehicle]
}

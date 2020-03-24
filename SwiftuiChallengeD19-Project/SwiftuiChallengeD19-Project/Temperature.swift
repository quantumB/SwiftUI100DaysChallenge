//
//  Temperature.swift
//  SwiftuiChallengeD19-Project
//
//  Created by Bernardino Guerrero on 22/03/20.
//  Copyright © 2020 Bernardino Guerrero. All rights reserved.
//

import Foundation

enum Temperature: String, CaseIterable {
    case celsius = "Celsius"
    case farenheit = "Farenheit"
    case kelvin = "Kelvin"
}

extension Temperature {
    var unit: UnitTemperature {
        switch self {
        case .celsius:
            return .celsius
        case .farenheit:
            return .fahrenheit
        case .kelvin:
            return .kelvin
        }
    }
}




//
//  Helpers.swift
//  Project Elsa
//
//  Created by Dennis Silva on 2/3/21.
//
import SwiftUI

func getSettingValue(forKey key: String) -> String? {
    return Bundle.main.infoDictionary?[key] as? String
}

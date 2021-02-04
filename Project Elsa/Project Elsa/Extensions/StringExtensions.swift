//
//  StringExtensions.swift
//  Project Elsa
//
//  Created by Dennis Silva on 2/3/21.
//

extension String {
    var isEmptyOrWhitespace: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

//
//  DateFormatter.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 19.08.2023.
//

import Foundation

extension Date {
    var prettyDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}

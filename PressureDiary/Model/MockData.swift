//
//  MockData.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 21.08.2023.
//

import Foundation

class MockData {
    open func takeData () -> Array<Record> {
        let mockArray = [
            Record(date: Date(), sysPressure: 135, diaPressure: 108, pulse: 76, Comment: "All good"),
            Record(date: Date(), sysPressure: 148, diaPressure: 122, pulse: 64, Comment: "Need tablets"),
            Record(date: Date(), sysPressure: 152, diaPressure: 130, pulse: 76, Comment: "Ooops"),
            Record(date: Date(), sysPressure: 121, diaPressure: 122, pulse: 64, Comment: "Need tablets"),
            Record(date: Date(), sysPressure: 113, diaPressure: 108, pulse: 76, Comment: "All good"),
            Record(date: Date(), sysPressure: 143, diaPressure: 122, pulse: 64, Comment: "Need tablets"),
            Record(date: Date(), sysPressure: 135, diaPressure: 108, pulse: 76, Comment: "All good"),
            Record(date: Date(), sysPressure: 124, diaPressure: 122, pulse: 64, Comment: "Need tablets"),
       ]
        return mockArray
    }
}

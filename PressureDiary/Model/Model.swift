//
//  Model.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 18.08.2023.
//
import Foundation
//MARK: - RecordProtocol
protocol RecordProtocol {
    var date: Date {set get}
    var sysPressure: Int {set get}
    var diaPressure: Int {set get}
    var pulse: Int {set get}
    var Comment: String? {set get}
}

struct Record: RecordProtocol {
    var date: Date
    var sysPressure: Int
    var diaPressure: Int
    var pulse: Int
    var Comment: String?
}

class Records {
    var activeRecords: Array<RecordProtocol> = []
    private let storage: StorageManagerProtocol = StorageManager()
    
    func addRecord(newRecord: RecordProtocol) {
        activeRecords.append(newRecord)
        self.saveRecords()
    }
    
    func removeRecord(recordIndex: Int) {
        activeRecords.remove(at: recordIndex)
    }
    
    func loadRecords() {
//        activeRecords = storage.array(forKey: .pressureDiaryData) as! Array<Record>
        activeRecords = [Record(date: Date(), sysPressure: 135, diaPressure: 108, pulse: 76, Comment: "All good"),
                         Record(date: Date(), sysPressure: 148, diaPressure: 122, pulse: 64, Comment: "Need tablets")
        ]
    }
    
    func saveRecords(){
        storage.set(activeRecords, forKey: .pressureDiaryData)
    }
    
}

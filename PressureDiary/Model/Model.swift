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
    var sysPressure: Int? {set get}
    var diaPressure: Int? {set get}
    var pulse: Int? {set get}
    var comment: String? {set get}
}

struct Record: RecordProtocol {
    var date: Date
    var sysPressure: Int?
    var diaPressure: Int?
    var pulse: Int?
    var comment: String?
}

class Records {
    var activeRecords: Array<RecordProtocol> = []
    private let storage: StorageManagerProtocol = StorageManager()
    
    func addRecord(newRecord: RecordProtocol) {
        activeRecords.append(newRecord)
//        self.saveRecords()
    }
    
    func getRecord(index: Int) -> RecordProtocol {
        return activeRecords[index]
    }
    
    func removeRecord(recordIndex: Int) {
        activeRecords.remove(at: recordIndex)
    }
    
    func loadRecords() {
        let mock = MockData()
//        guard let record = storage.array(forKey: .pressureDiaryData) else {return}
//        activeRecords = record as! Array<Record>
        activeRecords = mock.takeData()
    }
    
    func saveRecords(){
        storage.set(activeRecords, forKey: .pressureDiaryData)
    }
    
}

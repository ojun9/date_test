//
//  File.swift
//  
//
//  Created by jun on 2023/12/24.
//

import FoundationPreview


func before3days() {
    let calendar = Calendar(identifier: .gregorian)
    let startDate = Date()
    let endDate = startDate + (3600 * 24 * 3) // 3日後
    var currentDate = startDate
    var datesArray: [Date] = []

    while currentDate < endDate {
        if let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) {
            datesArray.append(nextDate)
            currentDate = nextDate
        } else {
            break
        }
    }

    print(datesArray)
}

func enumerate3Days() {
    let calendar = Calendar(identifier: .gregorian)
    let startDate = Date()
    var components = calendar.dateComponents([.hour, .minute, .second], from: startDate)
    var datesArray: [Date] = []

    calendar.enumerateDates(
        startingAfter: startDate,
        matching: components,
        matchingPolicy: .nextTimePreservingSmallerComponents
    ) { (date, exactMatch, stop) in
        if let date = date, datesArray.count < 3 {
            datesArray.append(date)
        } else {
            stop = true
        }
    }

    print(datesArray)
}


func after3days() {
    let calendar = Calendar(identifier: .gregorian)
    let startDate = Date()
    let endDate = startDate + (3600 * 24 * 3) + 1
    let dates = calendar.dates(byAdding: .day, startingAt: startDate, in: startDate..<endDate)
    let datesArray = Array(dates)
    print(datesArray)
}

before3days()
enumerate3Days()
after3days()

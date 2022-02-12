//
//  Date+.swift
//  To-Do
//
//  Created by Eser Kucuker on 12.02.2022.
//

import Foundation

func convertToString(date: Date) -> String {
    let date = date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.string(from: date)
}

//
//  Validiator+.swift
//  To-Do
//
//  Created by Eser Kucuker on 12.02.2022.
//

import Foundation

func isValidInput(Input: String) -> Bool {
    
    let regex = "^[A-zÀ-ú][A-zÀ-ú -]+$"
    let test = NSPredicate(format: "SELF MATCHES %@", regex)
    let result = test.evaluate(with: Input)
    
    return result
}

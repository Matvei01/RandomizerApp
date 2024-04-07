//
//  RandomNumber.swift
//  RandomizerApp
//
//  Created by Matvei Khlestov on 06.04.2024.
//

struct RandomNumber {
    
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}

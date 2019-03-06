// WordList.swift
// Created for Assignment 5 of CSI 380

import Foundation

// YOU FILL IN HERE
// You'll want to create a mechanism here for loading and querying
// words.txt. It's up to you how you do this. You may consider a struct.
public func readFromFile() -> [String] {
    var lines : [String] = []
    do {
        let text = try String(contentsOfFile: "words.txt")
        lines = text.components(separatedBy: "\n")
    } catch _ {
        print("error")
    }
    let capLines = lines.map { $0.uppercased() }
    return capLines
}

public func wordsOfLength(ofMinLength length: UInt) -> [String] {
    let text = readFromFile()
    let words = text.filter { $0.count >= length }
    return words
}

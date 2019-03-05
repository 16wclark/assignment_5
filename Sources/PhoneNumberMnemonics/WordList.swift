// WordList.swift
// Created for Assignment 5 of CSI 380

import Foundation

// YOU FILL IN HERE
// You'll want to create a mechanism here for loading and querying
// words.txt. It's up to you how you do this. You may consider a struct.
public func readFromFile() -> [String] {
    let text = String(contentsOfFile: "words.txt")
    let lines : [String] = text.components(separatedBy: "\n")
    return lines
}

public func wordsOfLength(length: Int) -> [String] {
    let text = readFromFile()
    let words = lines.filter { $0.count == length }
    return words
}

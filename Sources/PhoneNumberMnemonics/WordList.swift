/*
 Author: EJ Johnson & Will Clark
 Class: CSI-380-01
 Assignment: Assignment 5
 Date Assigned: 02/21
 Due Date: 03/05 11:59pm
 Description:
 This program gets all the possible fruit mnemonics for a phone number
 Certification of Authenticity:
 I certify that this is entirely my own work, except where I have given
 fully-documented references to the work of others. I understand the definition and
 consequences of plagiarism and acknowledge that the assessor of this assignment
 may, for the purpose of assessing this assignment:
 - Reproduce this assignment and provide a copy to another member of academic
 - staff; and/or Communicate a copy of this assignment to a plagiarism checking
 - service (which may then retain a copy of this assignment on its database for the
 - purpose of future plagiarism checking)
 */

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

public func wordsOfLength(ofMinLength length: Int) -> [String] {
    let text = readFromFile()
    let words = text.filter { $0.count >= length }
    return words
}

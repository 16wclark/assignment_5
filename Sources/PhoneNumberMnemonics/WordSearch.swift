// WordSearch.swift
// Created for Assignment 5 of CSI 380

import Foundation

// YOU FILL IN HERE
// Feel free to put in additional utility code as long as you have
// no loops, no *mutable* global variables, and no custom classes.

// Replaces each character in a phone number with an array of the
// possible letters that could be in place of that character
// For instance, 234 becomes [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"]]
public func letters(for phoneNumber: String) -> [[String]] {
       return phoneNumber.map {
        switch $0 {
            case "0":
                return ["0"]
            case "1":
                return ["1"]
            case "2":
                return ["A", "B", "C"]
            case "3":
                return ["D", "E", "F"]
            case "4":
                return ["G", "H", "I"]
            case "5":
                return ["J", "K", "L"]
            case "6":
                return ["M", "N", "O"]
            case "7":
                return ["P", "Q", "R", "S"]
            case "8":
                return ["T", "U", "V"]
            case "9":
                return ["W", "X", "Y", "Z"]
            default:
                return ["0"]
            }
        }
}


// Finds all of the ordered permutations of a given
// array of arrays of strings
// combining each choice in one
// array with each choice in the next array, and so on to produce strings
// For instance permuations(of: [["a", "b"], ["c"], ["d", "e"]]) will return
// ["acd", "ace" "bcd", "bce"]
public func permutations(of arrays: [[String]]) -> [String] {
    return arrays.reduce([]) { (result, next) -> [String] in result.flatMap { currentLetter in next.map { currentLetter + $0 } }}
}

// Finds all of the possible strings of characters that a phone number
// can potentially represent
// Uses letters(for:) and permutations(of:) to do this
public func possibles(for phoneNumber: String) -> [String] {
     let listOfLetters = letters(for: phoneNumber)
    return permutations(of: listOfLetters)
}

// Returns all of the words in a given *string* from the wordlist.txt file
// using only words in the word list of minimum length ofMinLength
public func wordsInString(_ string: String, ofMinLength length: UInt) -> [String] {
    return readFromFile().filter {
           return string.contains($0) && $0.count >= length
    }
}

// Returns all possibles strings of characters that a phone number
// can potentially represent that contain words in words.txt
// greater than or equal to ofMinLength characters
public func possiblesWithWholeWords(ofMinLength length: UInt, for phoneNumber: String) -> [String] {
     return possibles(for: phoneNumber).filter {
        return wordsInString($0, ofMinLength: length).count > 0
        
     }
           //maybe not done in progress
}

// Returns the phone number mnemonics that have the most words present in words.txt
// within them (note that these words could be overlapping)
// For instance, if there are two mnemonics that contain three words from
// words.txt, it will return both of them, if the are no other mnemonics
// that contain m.0
public func mostWords(for phoneNumber: String) -> [String] {
    let temp = possiblesWithWholeWords( ofMinLength: 0, for: phoneNumber)
    let temp2 = wordsInString(phoneNumber, ofMinLength: 0).map({ $0.count })
    let max =  temp2.max()
    let temp3 = temp.filter { wordsInString($0, ofMinLength: 0).count == max }
    return temp3
        
}

// Returns the phone number mnemonics with the longest words from words.txt
// If more than one word is tied for the longest, returns all of them
public func longestWords(for phoneNumber: String) -> [String] {
    let listOfPossibles = possiblesWithWholeWords(ofMinLength: 0, for: phoneNumber)
    print("list of possibles:", listOfPossibles)
    let longestWord = listOfPossibles.reduce("") {$0.count > $1.count ? $0:$1}
    let listOfLongestWords = listOfPossibles.filter { $0.count == longestWord.count }
    print("list of longest words:", listOfLongestWords)
    return listOfLongestWords
    //18006927753
}

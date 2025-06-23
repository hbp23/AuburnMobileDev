//
//  AdventureModels.swift
//  MyAdventure
//
//  Created by Harsh Patel on 6/22/25.
//

import Foundation

struct AdventureChoice {
    let text: String           // button text
    let nextNodeID: String     // ID of the next AdventureNode
}

struct AdventureNode {
    let id: String             // Unique ID
    let title: String
    let description: String
    let choices: [AdventureChoice] // button choices
    let backgroundImageName: String
}

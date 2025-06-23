//
//  AdventureLogic.swift
//  MyAdventure
//
//  Created by Harsh Patel on 6/22/25.
//

import Foundation

struct AdventureLogic {
    
    var currentNode: AdventureNode?
    
    init() {
        currentNode = nodes["start"]
    }
    
    let nodes = [
        "start": AdventureNode(
            id:"start",
            title: "You find a mysterious pocket watch",
            description: "You were on the way to work when you noticed a small, golden pocket watch on the ground. It looks ancient and mystical.",
            choices: [
                AdventureChoice(text: "Pick up the watch and take it with you.", nextNodeID: "work"),
                AdventureChoice(text: "Go to work leaving the watch.", nextNodeID: "end")
            ],
            backgroundImageName: "startBackground"
        ),
        "work": AdventureNode(
            id:"work",
            title: "The mysterious pocket watch at work",
            description: "All day at work the watch has been ticking away emitting a weird energy off of it. During lunch, you sit in your car and stare at it to decide what you should do next because it is starting to feel weird having it.",
            choices: [
                AdventureChoice(text: "Keep the watch for the rest of your shift and deal with it at home.", nextNodeID: "home"),
                AdventureChoice(text: "Throw the watch in the trashcan on the way back in the office.", nextNodeID: "end")
            ],
            backgroundImageName: "workBackground"
        ),
        "home": AdventureNode(
            id: "home",
            title: "Decisions, decisions",
            description: "On the way home, you pass by where you found it originally. You stop and ponder what you should do next.",
            choices: [
                AdventureChoice(text: "Go home and press the button on the watch.", nextNodeID: "success"),
                AdventureChoice(text: "Place the watch where it is was and go home.", nextNodeID: "end")
            ],
            backgroundImageName: "homeBackground"
        ),
        "success": AdventureNode(
            id: "success",
            title: "The world feels fine again!",
            description: "You turn on the news minutes later and see that 5 criminals were apprehend by the police with sheer luck. They were planning on blowing the whole world up. You feel puzzled that the way they got caught seemed so unplausible, but you also felt relieved for pressing the button on the watch.",
            choices: [
                AdventureChoice(text: "Play again!", nextNodeID: "start"),
                AdventureChoice(text: "Play again!", nextNodeID: "start")
            ],
            backgroundImageName: "successBackground"
        ),
        "end": AdventureNode(
            id: "end",
            title: "Mistakes were made",
            description: "You turn on the news minutes later when you got home and see that the world is slowing being blown up across the globe. You feel regret for not being able to press the button on the watch and see what would happen if you had. Now you'll never know.",
            choices: [
                AdventureChoice(text: "Start over!", nextNodeID: "start"),
                AdventureChoice(text: "Start over!", nextNodeID: "start")
            ],
            backgroundImageName: "endBackground"
        ),
    ]
    
    mutating func choose(optionIndex: Int) {
        let nextID = currentNode!.choices[optionIndex].nextNodeID
        currentNode = nodes[nextID]
    }
}


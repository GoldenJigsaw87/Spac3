//
//  main.swift
//  Spac3
//
//  Created by Mark Jensen on 10/11/24.
//



import Foundation

struct Place {
    var placeName: String
    var description: String
    var doors: [String: String]
    
    init(location: String, description: String, doors: [String : String]) {
        self.placeName = location
        self.description = description
        self.doors = doors
    }
}

class Game {
    
    var currentLocation: Place?
    var places: [String: Place]
    
    init() {
        let moon = Place(location: "themoon", description: "Earth's Moon [year 2077]", doors: ["west": "biodome"])
        let biodome = Place(location: "biodome", description: "Excavator Epsilon...wait wrong game", doors: ["east": "teleporter"])
        let teleporter = Place(location: "teleporter", description: "One way destination to an unknown location", doors: ["south": "unknownland"])
        let unknownland = Place(location: "unknownland", description: "Thick atmosphere, red landscape, and I think I saw Elon", doors: ["south": "deepmars"])
        let deepMars = Place(location: "deepmars", description: "Looks much nicer in person", doors: ["west": "teleporter2"])
        let teleporter2 = Place(location: "teleporter2", description: "Musk tech huh?", doors: ["north": "earth"])
        let earth = Place(location: "earth", description: "So why did Musk need the one on the moon? Cause he felt like it, that's why!", doors: ["west": "recreationroom"])
        let recreationRoom = Place(location: "recreationroom", description: "A pool table with 2 guys standing at it", doors: ["west": "thetable"])
        let theTable = Place(location: "thetable", description: "Who wins, Tommy or Karson?", doors: ["west": "end"])
        
        self.places = [
            "themoon": moon,
            "biodome": biodome,
            "teleporter": teleporter,
            "unknownland": unknownland,
            "deepmars": deepMars,
            "teleporter2": teleporter2,
            "earth": earth,
            "recreationroom": recreationRoom,
            "thetable": theTable
        ]
        self.currentLocation = moon
    }
    
    func move(direction: String) {
        if let nextPlaceKey = self.currentLocation?.doors[direction] {
            if let newLocation = self.places[nextPlaceKey] {
                self.currentLocation = newLocation
                describeCurrentPlace()
            } else {
                print("There's no place in that direction.")
            }
        } else {
            print("There's nothing in that direction.")
        }
    }
    
    func describeCurrentPlace() {
        if let currentPlace = self.currentLocation {
            print("Welcome to \(currentPlace.placeName): \(currentPlace.description)")
        }
    }
}

print("Welcome to Spac3!")

var game = Game()

while true {
    print("\nHow will you proceed? (type 'HELP' for option menu)")
    if let input = readLine()?.lowercased() {
        switch input {
        case "help":
            print("Commands: ['north', 'south', 'east', 'west'] to move, 'exit' to exit the game.")
        case "north", "south", "east", "west":
            game.move(direction: input)
        case "exit":
            print("Mama didn't raise no quitter!")
            exit(0)
        default:
            print("I'mma pretend I didn't hear that.")
        }
    }
}

//import Foundation
//struct Place {
//    var Place: String
//    var Description: String
//    var doors: [String: String]
//    init(Location: String, Description: String, item: String? = nil, doors: [String : String]) {
//        self.Place = Location
//        self.Description = Description
//        self.doors = doors
//    }
//       
//    }
//
//
//class Game {
//    
//    var currentLocation: Place?
//    var currentPlace: [String: Place]
//    
//    init(currentLocation: [String : Place] = ["The Moon": Place(Location: "themoon", Description: "Earth's Moon [year 2077]", doors: ["west": "biodome enterance"])] ){
//        self.currentPlace = currentLocation
//        
//        let moon = Place(Location: "themoon", Description: "Earth's Moon [year 2077]", doors: ["west": "biodome"])
//        let biodome = Place(Location: "biodome", Description: "Excavator Epsilon...wait wrong game",  doors: ["east": "biodome teleporter"])
//        let teleporter = Place(Location: "the teleporter", Description: "One way destination to an unknown location", doors: ["South": "Unknown land"])
//        let unknownland = Place(Location: "unknown land", Description: "Thick atmosphere, red landscape, and I think I saw Elon", doors: ["south": "deep mars"])
//        let DeepMars = Place(Location: "Deep Mars", Description: "Looks much nicer in person", doors: ["west": "teleporter2"])
//        let teleporter2 = Place(Location: "teleporter2", Description: "Musk tech huh?", doors: ["north": "earth"])
//        let earth = Place(Location: "earth", Description: "So why did Musk need the one on the moon? Cause he felt like it that's why!", doors: ["west": "recreationroom"])
//        let recreationroom = Place(Location: "RecreationRoom", Description: "A pool table with 2 guys standing at it", doors: ["west": "TheTable"])
//        let thetable = Place(Location: "thetable", Description: "Who wins Tommy or Karson?", doors: ["west": "end"])
//        
//        
//        self.currentPlace = [
//            "themoon": moon,
//            "biodome": biodome,
//            "teleporter": teleporter,
//            "unknownland": unknownland,
//            "deepmars": DeepMars,
//            "teleporter2": teleporter2,
//            "earth": earth,
//            "recreationroom": recreationroom,
//            "thetable": thetable
//            
//        ]
//        self.currentLocation = moon
//    }
//    
//    func move(direction: String) {
//        if let nextPlace = self.currentLocation?.doors[direction] {
//
//            if let newLocation = self.currentPlace[nextPlace] {
//                self.currentLocation = newLocation
//                if newLocation.Place == "biodome" {
//                    secondPlace()
//                    return
//                }
//                if newLocation.Place == "biodome" {
//                    secondPlace()
//                }
//                if newLocation.Place == "teleporter" {
//                    thirdPlace()
//                }
//                if newLocation.Place == "unknownland" {
//                    fourthPlace()
//                }
//                if newLocation.Place == "deepmars" {
//                    fifthPlace()
//                }
//                if newLocation.Place == "teleporter2" {
//                    sixthPlace()
//                }
//                if newLocation.Place == "earth" {
//                    seventhPlace()
//                }
//                if newLocation.Place == "recreationroom" {
//                    eighthPlace()
//                }
//                if newLocation.Place == "thetable" {
//                    lastPlace()
//                }
//                
//            }
//            describeCurrentPlace() // Describe the new place
//        } else {
//            print("There's nothing in that direction.")
//        }
//        
//    }
//    
//    func describeCurrentPlace() {
//        print("Welcome to \(self.currentPlace["moon"]?.Description ?? ""). ")
//    }
//    func secondPlace(){
//        print("Welcome to \(self.currentPlace["biodome"]?.Description ?? ""). ")
//    }
//    func thirdPlace(){
//        print("Welcome to \(self.currentPlace["teleporter"]?.Description ?? ""). ")
//    }
//    func fourthPlace(){
//        print("Welcome to \(self.currentPlace["unknownland"]?.Description ?? ""). ")
//    }
//    func fifthPlace(){
//        print("Welcome to \(self.currentPlace["deepmars"]?.Description ?? ""). ")
//    }
//    func sixthPlace(){
//        print("Welcome to \(self.currentPlace["teleporter2"]?.Description ?? ""). ")
//    }
//    func seventhPlace(){
//        print("Welcome to \(self.currentPlace["earth"]?.Description ?? ""). ")
//    }
//    func eighthPlace(){
//        print("Welcome to \(self.currentPlace["recreationroom"]?.Description ?? ""). ")
//    }
//    func lastPlace(){
//        print("Welcome to \(self.currentPlace["thetable"]?.Description ?? ""). ")
//    }
//    
//    
//    print("Welcome to Spac3")
//}
//
//    var game = Game()
//    while true {
//        print("\nHow will you proceed? (type 'HELP' for option menu)")
//        if let input = readLine()?.lowercased() {
//            switch input{
//            case "help":
//                print("Commands: ['north', 'south', 'east', 'west'] to move, 'exit' to exit")
//            case "north", "south", "east", "west":
//                game.move(direction: input)
//                
//                
//            case "exit":
//                print("Mama didn't raise no quitter!")
//                break
//            default:
//                print("Imma pretend I didn't hear that")
//                
//            }
//        }
//    }
//

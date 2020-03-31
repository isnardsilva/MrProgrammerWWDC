import GameplayKit.GKRandomSource

public struct SymbolData {
    // Nome dos simbolos que estao armazenadas no projeto
//    private static let symbols: [String] = ["AirPlay", "AppExtensions", "ARKit", "Audio", "AVFoundation", "Bluetooth", "Bonjour", "CareKit", "CarPlay", "ClassKit", "CloudKit", "CoreML", "CreateML", "GameCenter", "GameController64x64", "GameplayKit", "Handoff", "HealthKit", "HomeKit", "iCloudDrive", "iMessage", "MapKit", "Metal", "ModelIO64x64", "MusicKit", "Notifications", "ODR64x64", "PassKit", "RealityKit", "ReplayKit", "ResearchKit", "Safari", "SceneKit", "SFSymbols", "SiriKit", "SpriteKit", "Swift", "SwiftUI", "WatchKit", "WebKit"]
    
//    private static let symbols: [String] = ["AppExtensions", "ARKit", "Audio", "AVFoundation", "CareKit", "CarPlay", "ClassKit", "CloudKit", "CoreML", "GameCenter", "GameController64x64", "GameplayKit", "Handoff", "HealthKit", "HomeKit", "iMessage", "MapKit", "Metal", "MusicKit", "Notifications", "PassKit", "RealityKit", "ReplayKit", "ResearchKit", "SceneKit", "SFSymbols", "SiriKit", "SpriteKit", "Swift", "SwiftUI", "WatchKit", "WebKit"]
    
    
    private static let symbols: [String] = ["ARKit", "Audio", "AVFoundation", "CareKit", "CarPlay", "ClassKit", "CloudKit", "CoreML", "GameCenter", "GameController64x64", "GameplayKit", "Handoff", "HealthKit", "HomeKit", "iMessage", "Metal", "MusicKit", "Notifications", "RealityKit", "ReplayKit", "ResearchKit", "SceneKit", "SiriKit", "SpriteKit", "Swift", "SwiftUI", "WatchKit", "WebKit"]
    
    
    
    // Instanciando o manipulador de randomizacao
    private static let randomSource = GKRandomSource.sharedRandom()
    
    public static func getSymbols(amout: Int) -> [String] {
        let indexes = getRandomNumbers(maxNumber: symbols.count - 1, amout: amout)
        var drawnSymbols: [String] = []
        
        for index in indexes {
            drawnSymbols.append(symbols[index])
        }
        
        return drawnSymbols
    }
    
    public static func getAllSymbols() -> [String] {
        return randomSource.arrayByShufflingObjects(in: symbols) as! [String]
//        return symbols
    }
    
    private static func getRandomNumbers(maxNumber: Int, amout: Int) -> Set<Int> {
        var numbers = Set<Int>()
        
        while numbers.count < amout {
            let randomNumber = randomSource.nextInt(upperBound: maxNumber + 1)
            numbers.insert(randomNumber)
        }
        
        return numbers
    }
}


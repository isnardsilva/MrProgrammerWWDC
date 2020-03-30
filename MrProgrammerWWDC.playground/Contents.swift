import PlaygroundSupport
import UIKit


// Instanciando a View Controller com a Tela Inicial
let startViewController = StartViewController()
// Instanciando um Navigation Controller para gerenciar todas as Views
let navController = UINavigationController(rootViewController: startViewController)
navController.setNavigationBarHidden(true, animated: true)

PlaygroundPage.current.liveView = navController

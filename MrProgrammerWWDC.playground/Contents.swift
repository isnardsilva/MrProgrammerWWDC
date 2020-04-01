import PlaygroundSupport
import UIKit


// Instanciando a View Controller com a Tela Inicial
let startViewController = StartViewController()
startViewController.preferredContentSize = CGSize(width: 414.0, height: 896.0)
// Instanciando um Navigation Controller para gerenciar todas as Views
let navController = UINavigationController(rootViewController: startViewController)
navController.setNavigationBarHidden(true, animated: true)

PlaygroundPage.current.liveView = navController

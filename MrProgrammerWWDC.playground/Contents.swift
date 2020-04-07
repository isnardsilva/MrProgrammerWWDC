/*:
 # Mr. Programmer
 
 
 ### 🧩 O que é?
 **Mr. Programmer** é um jogo onde você vai assumir o papel de um programador, mais especificamente, um iOS Developer. Desenvolva projetos, lide com prazos e procure as tecnologias que você precisa, mas principalmente, supere desafios!
 
 
 ### 🎯 Por que?
 Esse projeto tem o intuito de mostrar um pouco do que me representa, o que faz parte da minha rotina nos ultimos anos. Eu sou um programador, mais especificamente, um iOS Developer, e superar desafios faz parte da minha rotina. Dessa forma, eu decidi passar, de uma maneira simples e divertida, um pouco dessa experiência para vocês.
 
 ### ✅ Como?
 No game, você acabou de ser contratado por uma empresa e sera integrante do time de iOS Developer junto comigo. Mas fique tranquilo, eu vou lhe dar todas as dicas para você desenvolver o seu primeiro projeto. Eu vou lhe falar as tecnologias que você vai preicsar e como você pode encontrá-las. Mas lembre-se, você tem prazos para cumprir.

 ---
 */


import PlaygroundSupport
import UIKit


// Instanciando a View Controller com a Tela Inicial
let startViewController = StartViewController()
startViewController.preferredContentSize = CGSize(width: 400, height: 800)
// Instanciando um Navigation Controller para gerenciar todas as Views
let navController = UINavigationController(rootViewController: startViewController)
navController.setNavigationBarHidden(true, animated: true)

PlaygroundPage.current.liveView = navController

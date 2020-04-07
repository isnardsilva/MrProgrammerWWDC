import UIKit

public class FinalMessagePageViewController: UIPageViewController {
    // MARK: - Properties
    public var pages: [UIViewController] = []
    public let initialPage: Int = 0
    
    public let pageControl = UIPageControl()
    
    
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
         
        let page1 = MessageViewController(titleMessage: "Projeto Concluído!",
                                          textMessage: "Ultimamente, a maior parte da \nminha rotina consiste nesse \nciclo que você acabou de \nconcluir! \n\nDesenvolver projetos, estudar \nnovas tecnologias, lidar com \nprazos… superar desafios!")
        
        let page2 = MessageViewController(titleMessage: "Eu amo ser iOS Developer!",
                                          textMessage: "Mas ao fim de cada projeto, eu \nfico orgulhoso do quanto eu me \nsuperei e de como é gratificante \nmudar a vida das pessoas \natravés da tecnologia!")
        
        let page3 = MessageViewController(titleMessage: "O sonho da WWDC",
                                          textMessage: "E ir para a WWDC seria uma \noportunidade incrível de \nencontrar as pessoas que \ncompartilham essa paixão \ncomigo! \n\n\nObrigado! 👨🏻‍💻")
        
        
        
        self.pages.append(contentsOf: [page1, page2, page3])
        
        self.setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        self.setupPageControl()
    }
    
    private func setupPageControl() {
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = initialPage
        self.view.addSubview(self.pageControl)

        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pageControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200)
        ])
    }
}



// MARK: - UIPageViewControllerDataSource
extension FinalMessagePageViewController: UIPageViewControllerDataSource {
    // Executado quando o usuario rolar a pagina para a esquerda (antes - before)
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Pegando o indice da View Controller sendo exibida no momento
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            
            // Verificando se a View Controller sendo exibida e a primeira
            if viewControllerIndex == 0 {
                // Se for a primeira, continua exibindo ela
                return nil
            } else {
                // Se nao for, exibe a do lado esquerdo (antes - before)
                return self.pages[viewControllerIndex - 1]
            }
        }
        
        return nil
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Pegando o indice da View Controller sendo exibida no momento
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            
            // Verificando se a View Controller sendo exibida e a ultima
            if viewControllerIndex < self.pages.count - 1 {
                // Se nao for, exibe a do lado direito (depois - after)
                return self.pages[viewControllerIndex + 1]
            } else {
                // Se for a ultima, continua exibindo ela
                return nil
            }
        }
        
        return nil
    }
}

// MARK: - UIPageViewControllerDelegate
extension FinalMessagePageViewController: UIPageViewControllerDelegate {
    // Executado ao final de cada alteracao de Page (View Controller)
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
            // Pegando o indice da View Controller que vai ser exibida
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                // Atualizando o Page Control
                self.pageControl.currentPage = viewControllerIndex
            }
        }
        
    }
}

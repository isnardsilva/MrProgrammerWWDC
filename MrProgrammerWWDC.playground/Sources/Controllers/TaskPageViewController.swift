import UIKit

public class TaskPageViewController: UIPageViewController {
    // MARK: - Properties
    public var pages: [UIViewController] = []
    public let initialPage: Int = 0
    
    public let pageControl = UIPageControl()
    
//    public var taskPageView: TaskPageView! {
//        // Verificando se a View ja foi carregada
//        guard isViewLoaded else { return nil }
//
//        return (view as! TaskPageView)
//    }
    
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        /*
         
         Você vai integrar a equipe de \niOS Developer junto comigo. \n\nNão se preocupe! Eu vou te \nmostrar como é a rotina \nde um programador em uma \nempresa…
         */
         
        let page1 = MessageViewController(titleMessage: "Hello, Mr. Programmer!",
                                          textMessage: "Me contaram que esse é o\n seu primeiro emprego como\n programador. \n\nGostei do que ouvi sobre suas \nhabilidades…")
        
        let page2 = MessageViewController(titleMessage: "Estaremos juntos!",
                                          textMessage: "Você vai integrar a equipe de \niOS Developer junto comigo. \n\nNão se preocupe! Eu vou te \nmostrar como é a rotina \nde um programador em uma \nempresa…")
        
        let page3 = GoalViewController()
        
        self.pages.append(contentsOf: [page1, page2, page3])
        
        self.setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        self.setupPageControl()
    }
    
    private func setupPageControl() {
        // Add Page Control
//        self.pageControl.frame = .zero
//        self.pageControl.currentPageIndicatorTintColor = UIColor.black
//        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = initialPage
        self.view.addSubview(self.pageControl)

        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pageControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200)
        ])
//        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
//        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
//        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}


// MARK: - UIPageViewControllerDataSource
extension TaskPageViewController: UIPageViewControllerDataSource {
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
extension TaskPageViewController: UIPageViewControllerDelegate {
    // Executado ao final de cada alteracao de Page (View Controller)
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
            // Pegando o indice da View Controller que vai ser exibida
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                // Atualizando o Page Control
                self.pageControl.currentPage = viewControllerIndex
                
                // Verificando se a transicao ocorreu para a ultima Page
                if viewControllerIndex != (pages.count - 1) {
                    self.pageControl.isHidden = false
                }
            }
        }
        
//        print("didFinishAnimating")
    }
    
//    public func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
//        <#code#>
//    }
    // Executado quando a transicao para outra Page (View Controller) comecar
    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//        print("willTransitionTo")
//        print(pendingViewControllers[0])
        
        if let nextViewController = pendingViewControllers.first {
            if nextViewController == pages.last! {
                self.pageControl.isHidden = true
            }
//            else {
//                self.pageControl.isHidden = false
//            }
//            print(nextViewController)
        }
        
//        if let viewControllers = pageViewController.viewControllers {
//            // Pegando o indice da View Controller que vai ser exibida
//            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
//
//                if viewControllerIndex == 2 {
//                    self.pageControl.isHidden = true
//                } else {
//                    self.pageControl.isHidden = false
//                }
//            }
//        }
    }
}

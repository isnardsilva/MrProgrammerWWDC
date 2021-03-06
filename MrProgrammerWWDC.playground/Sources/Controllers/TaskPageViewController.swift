import UIKit

public class TaskPageViewController: UIPageViewController {
    // MARK: - Properties
    public var pages: [UIViewController] = []
    public let initialPage: Int = 0
    
    public let pageControl = UIPageControl()
    public let goButton = UIButton()
    
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
         
        let page1 = MessageViewController(titleMessage: "Olá, Mr. Programmer!",
                                          textMessage: "Me contaram que esse é o\n seu primeiro emprego como\n programador. \n\nGostei do que ouvi sobre suas \nhabilidades…")
        
        let page2 = MessageViewController(titleMessage: "Estaremos juntos!",
                                          textMessage: "Você vai integrar a equipe de \niOS Developer junto comigo. \n\nNão se preocupe! Eu vou te \nmostrar como é a rotina \nde um programador em uma \nempresa…")
        
        let page3 = GoalViewController()
        
        self.pages.append(contentsOf: [page1, page2, page3])
        
        self.setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        self.setupPageControl()
        self.setupGoButton()
    }
    
    private func setupPageControl() {
        // Add Page Control
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = initialPage
        self.view.addSubview(self.pageControl)

        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pageControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200)
        ])
    }
    
    private func setupGoButton() {
        self.goButton.isHidden = true
        self.view.addSubview(self.goButton)
        
        
        
        self.goButton.setTitle("GO", for: .normal)
        goButton.setTitleColor(.white, for: .normal)
        goButton.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        
        self.goButton.setBackgroundImage(UIImage(named: "ButtonNormal"), for: .normal)
        self.goButton.setBackgroundImage(UIImage(named: "ButtonPressed"), for: .highlighted)
        
        self.goButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.goButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.goButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 270)
        ])
        
        self.goButton.addTarget(self, action: #selector(goGame), for: .touchUpInside)
    }
    
    
    // MARK: - Actions
    @objc public func goGame() {
//        print("Go")
        self.navigationController?.pushViewController(GameViewController(), animated: true)
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
                    self.goButton.isHidden = true
                } else {
                    self.goButton.isHidden = false
                }
            }
        }
        
    }
    
    // Executado quando a transicao para outra Page (View Controller) comecar
    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//        print("willTransitionTo")
//        print(pendingViewControllers[0])
        
        if let nextViewController = pendingViewControllers.first {
            if nextViewController == pages.last! {
                self.pageControl.isHidden = true
//                self.goButton.isHidden = false
            } else {
                self.goButton.isHidden = true
            }
        }        
    }
}

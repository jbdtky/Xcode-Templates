//___FILEHEADER___

import UIKit
import Combine

class ___FILEBASENAME___: UIViewController {
    
    private var disposables = Set<AnyCancellable>()
    lazy var viewModel: ViewModel = {
        // TODO: Choose your way to initialize it depending on Storyboard or Code
        fatalError("It should be initialized")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
    }
    
    func setupUI() {
        // TODO: Setup UI
    }
    
    func setupViewModel() {
        // TODO: Setup ViewModel
        viewModel
            .state
            .receive(on: DispatchQueue.main)
            .sink { state in
                switch state {
                case .initial:
                    // TODO: Setup the UI with the fetched data
                    break
                case .success:
                    // TODO: It may want to transit?
                    break
                }
            }
            .store(in: &disposables)
    }
}

//___FILEHEADER___

import UIKit

class ___FILEBASENAME___: UIViewController {
    
    private var disposables = Set<AnyCancellable>()
    private let viewModel = ViewModel(repository: RepositoryImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
    }
    
    func setupUI() {
        // TODO: Setup UI
    }
    
    func setupViewModel() {
        viewModel
            .state
            .receive(on: DispatchQueue.main)
            .sink { state in
                switch state {
                case .initial:
                    // ...
                    break
                }
            }
        .store(in: &disposables)
    }
}

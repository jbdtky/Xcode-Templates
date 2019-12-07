//___FILEHEADER___

import UIKit
import Combine

class ___FILEBASENAME___ {
    enum State {
        case initial
        case success
    }
    
    private var disposables = Set<AnyCancellable>()
    private let repository: Repository
    
    private(set) var state: CurrentValueSubject<State, Error> // If state is needed
    private(set) var value: CurrentValueSubject<String, Error> // If value is needed
    
    init(repository: Repository) {
        self.repository = repository
        state = CurrentValueSubject(.initial) // If state is needed
    }
    
    func fetch(_ arg: String) {
            repository
                .get(arg)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] value in
                    self?.value.value = value
                }
                .store(in: &disposables)
    }
}

protocol Repository {
    func get(_ arg: String) -> AnyPublisher<String, Never>
}

protocol Service {
    func fetch(_ arg: String) -> AnyPublisher<String, Never>
}

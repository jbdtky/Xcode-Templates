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
    
    private(set) var state: PassthroughSubject<State, Never>()
    private(set) var strongValue: String
    
    init(repository: Repository = RepositoryImpl(),
         value: String) {
        self.repository = repository
        self.weakValue = CurrentValueSubject(nil) // Placeholder
        self.strongValue = value
        
        self.repository
            .get(arg)
            .sink { [weak self] value in
                self?.strongValue = value
                self?.state.send(.initial)
            }
            .store(in: &disposables)
    }
    
    func submitValue() {
        repository
            .post()
            .sink { [weak self] _ in
                self?.state.value = .success
            }
            .store(in: &disposables)
    }
}

protocol Repository {
    func get(_ arg: String) -> AnyPublisher<String, Never>
    func post() -> AnyPublisher<String, Never>
}

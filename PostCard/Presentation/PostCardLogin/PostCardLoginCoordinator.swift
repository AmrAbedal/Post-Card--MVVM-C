//
//  PostCardLoginCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import UIKit

class PostCardLoginCoordinator {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let viewModel = PostCardLoginViewModel(coordinator: self, loginUseCase: LoginUseCaseImplementation(), dataSource: SiginInDataSourceImplementation())
        let vc = PostCardLoginViewController(viewModel: viewModel)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func navigateToMainScreen() {
        PostCardMainCoordinator(navigationContoller: navigationController).start()
    }
    
}

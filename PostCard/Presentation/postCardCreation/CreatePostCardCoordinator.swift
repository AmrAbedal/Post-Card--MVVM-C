//
//  CreatePostCardCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import UIKit

class CreatePostCardCoordinator {
    private weak var delegate: CreateNewPostCardDelegate?
    private let presentingViewController: UIViewController
    init(presentingViewController: UIViewController, delegate: CreateNewPostCardDelegate?) {
        self.presentingViewController = presentingViewController
        self.delegate = delegate
    }
    
    func start() {
        let viewModel = CreatePostCardViewModel.init(coordinator: self, usecase: SavePostCardUseCaseImplementation())
        let tabBarController = CreatePostCardTabBarViewController.init(viewModel: viewModel)
        self.presentingViewController.present(tabBarController, animated: true, completion: nil)
    }
    
    func setupTapBar(tabBarController: UITabBarController, delegate: CreatePostCardDelegate) {
        PostCardStyleCoordinator.init(tabBarController: tabBarController, delegate: delegate).start()
        PostCardImageCoordinator.init(tabBarController: tabBarController, delegate: delegate).start()
        PostcardTextCoordinator.init(tabBarController: tabBarController, delegate: delegate, dataSource: delegate).start()
        PostCardViewCoordinator.init(tabBarController: tabBarController, delegate: delegate).start()
        PostCardSummaryCoordinator.init(tabBarController: tabBarController, delegate: delegate).start()
    }
    func cardSaved() {
        delegate?.newCardSavedSuccessfully()
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    func showErrorToast() {
        // showErrorToast
    }
}

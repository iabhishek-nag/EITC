//
//  Coordinator.swift
//  EITC
//
//  Created by Abhishek Singh on 20/07/23.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }

    func start()
}

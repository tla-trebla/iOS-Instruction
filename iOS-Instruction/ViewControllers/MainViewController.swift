//
//  MainViewController.swift
//  iOS-Instruction
//
//  Created by Albert on 26/01/23.
//

import UIKit
import Instructions

class MainViewController: UIViewController, CoachMarksControllerDelegate {
    
    let coachMarksController = CoachMarksController()
    
    private lazy var orderMethodView: OrderMethodView = {
        let orderMethodView = OrderMethodView()
        
        return orderMethodView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coachMarksController.dataSource = self
        self.coachMarksController.overlay.isUserInteractionEnabled = true
        
        setupMainView()
        setupNavigationBar()
        setupViews()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.coachMarksController.start(in: .window(over: self))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.coachMarksController.stop()
    }
    
    private func setupMainView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Checkout"
    }
    
    private func setupViews() {
        view.addSubview(orderMethodView)
    }
    
    private func setupLayout() {
        orderMethodView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orderMethodView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            orderMethodView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            orderMethodView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
}

extension MainViewController: CoachMarksControllerDataSource {
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
        return coachMarksController.helper.makeCoachMark(for: orderMethodView)
    }
    
    func coachMarksController(
        _ coachMarksController: CoachMarksController,
        coachMarkViewsAt index: Int,
        madeFrom coachMark: CoachMark
    ) -> (bodyView: (UIView & CoachMarkBodyView), arrowView: (UIView & CoachMarkArrowView)?) {
        
        let bodyView = MainCoachMarkBodyView()
        let arrowView = CoachMarkArrowDefaultView(orientation: .top)

        return (bodyView: bodyView,
                arrowView: arrowView)
    }
}

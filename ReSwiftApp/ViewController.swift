//
//  ViewController.swift
//  ReSwiftApp
//
//  Created by 野瀬 玲 on 2021/05/26.
//

import UIKit
import ReSwift

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appStore.subscribe(self) { $0.select(\.counter) }
    }

    @IBAction func downButtonDidTouchUpInside(_ sender: Any) {
        appStore.dispatch(CounterState.Action.decrease)
    }

    @IBAction func upButtonDidTouchUpInside(_ sender: Any) {
        appStore.dispatch(CounterState.Action.increase)
    }

    @IBAction func nextButtonDidTap(_ sender: Any) {
        let vc = R.storyboard.second.instantiateInitialViewController()!
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = CounterState
    func newState(state: CounterState) {
        countLabel.text = state.value.description
    }
}

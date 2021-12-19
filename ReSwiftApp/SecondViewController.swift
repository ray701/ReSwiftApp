//
//  SecondViewController.swift
//  ReSwiftApp
//
//  Created by 野瀬 玲 on 2021/05/27.
//

import UIKit
import ReSwift

class SecondViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appStore.subscribe(self) { $0.select(\.sentence) }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        appStore.dispatch(SentenceState.Action.reset)
        appStore.unsubscribe(self)
    }

    @IBAction func leftButtonDidTap(_ sender: Any) {
        appStore.dispatch(SentenceState.Action.increaseString("あ"))
    }

    @IBAction func rightButtonDidTap(_ sender: Any) {
        appStore.dispatch(SentenceState.Action.increaseString("さ"))
    }
}

extension SecondViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = SentenceState

    func newState(state: SentenceState) {
        contentLabel.text = state.value
    }
}

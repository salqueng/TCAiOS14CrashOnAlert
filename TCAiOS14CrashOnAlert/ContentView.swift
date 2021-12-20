//
//  ContentView.swift
//  TCAiOS14CrashOnAlert
//
//  Created by Dahoon Kim on 2021/12/20.
//

import SwiftUI
import ComposableArchitecture

enum AlertAction {
  case dismiss
}
struct ContentState {
  var alert: AlertState<AlertAction>?
  init() {}
}

enum ContentAction {
  case alert(_: AlertAction)
}

let contentReducer = Reducer<ContentState, ContentAction, Void>.init { _, _, _ in
  return .none
}


struct ContentView: View {
  let store: Store<ContentState, ContentAction>
  init() {
    store = .init(initialState: .init(), reducer: contentReducer, environment: ())
  }
  var body: some View {
    Text("Hello, world!")
      .padding()
      .alert(store.scope(state: { $0.alert }, action: { .alert($0) }), dismiss: AlertAction.dismiss)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

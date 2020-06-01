//
//  VisibilityModifiers.swift
//  
//
//  Created by Carson Katri on 5/28/20.
//
import JavaScriptKit
fileprivate let waitForElem = JSObjectRef.global.waitForElem.function

public extension View {
  func onAppear(perform action: (() -> Void)? = nil) -> some View {
    return modifier(OnLoadModifier(action: action ?? {}))
  }
}

struct OnLoadModifier: ViewModifier {
  let action: () -> Void
  
  func buildTree<T: View>(for view: T, in context: TreeStateContext) -> HTMLTreeNode {
    if context.buildOrigin == .initial {
      action()
    }
    return context.currentBuilder.buildTree(for: view, in: context)
  }
}


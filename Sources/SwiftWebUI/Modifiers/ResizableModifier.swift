//
//  ResizableModifier.swift
//  SwiftWebUI
//
//  Created by Carson Katri on 6/13/20.
//

public extension Image {
  func resizable() -> ModifiedContent<Self, ResizableModifier> {
    return modifier(ResizableModifier(image: self))
  }
}

public struct ResizableModifier: ViewModifier {
  let image: Image
  
  public func buildTree<T: View>(for view: T, in context: TreeStateContext)
              -> HTMLTreeNode
  {
    return HTMLImageNode(elementID : context.currentElementID,
                         storage   : image.storage,
                         scale     : context.environment.imageScale,
                         resizable : true)
  }
}

///Stack Implementation


import Foundation


public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    //MARK: push operation to put an element in the Stack
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    //MARK: pop operation to remove an element from the Stack
    @discardableResult
    public mutating func pop() -> Element?{
        storage.popLast()
    }
    
    //MARK: peek operation is to look at the recent element added to stack
    public func peek() -> Element? {
     storage.last
    }
    
    //MARK: to check if stack is empty
    public var isEmpty: Bool {
      peek() == nil
    }
}

//MARK : to represent the stack output in the output window
extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map{"\($0)"}.reversed().joined(separator: "\n"))
        """
    }
}

//MARK: Expressible by Array literal is a simple way of expressing a list of values
extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}

//MARK: Example fucntion which creates a stack of characters and then pops the last added one
func example(of: String = "using a stack") {
    var stack : Stack = ["a","b","c","d","e","f","g"]
  print(stack)
    if let poppedElement = stack.pop() {
       assert("g" == poppedElement)
       print("Popped: \(poppedElement)")
     }
   }

example()



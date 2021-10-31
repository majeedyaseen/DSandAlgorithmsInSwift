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



//MARK: Challenge task
///Check for balanced parentheses like below using stack
// 1 h((e))llo(world)() // balanced parentheses
// 2 (hello world // unbalanced parentheses

func areParanthesesBalanced(_ string: String) -> Bool {
    var stack = Stack<Character>()
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

areParanthesesBalanced("h((e))llo(world)()")
areParanthesesBalanced("(hello world")

//
//  MyLinkedList.swift
//  Single Indexed Double Linked List
//
//  Created by Eremej Sumcenko on 14.04.2021.
//

import Foundation


// MARK: - my linked list
/**
 double linked list
 
 main  : root -> node(0) -> node(1) -> ... -> node(n)
 
 count == 0:
    root = end
  
 head = root.next
 */
class MyLinkedList: LinkedList {
    let root: DLNode<Int>
    var end: DLNode<Int>
    
    var count: Int
    
    init() {
        root = DLNode(0)
        end = root
        
        count = 0
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index >= count || index < 0 { return -1 }
        
        return findNode(index).value
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        root.linkNext(val)
        if count == 0 { end = root.next! }

        count += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        end.linkNext(val)
        end = end.next!
        
        count += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count || index < 0 { return }
        else if index == count { addAtTail(val) }
        else if index == 0 { addAtHead(val) }
        else {
            findNode(index).linkPrevious(val)
            
            count += 1
        }
    }
    
    func deleteHead() {
        if count == 0 { return }
        else if count == 1 {
            end = root
        } else {
            root.linkNext(root.next!.next!)
        }
        
        count -= 1
    }
    
    func deleteTail() {
        if count == 0 { return }
        end = end.previous!
        
        count -= 1
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if count == 0 || index >= count || index < 0 { return }
        else if index == count - 1 { deleteTail() }
        else if index == 0 { deleteHead() }
        else {
            let nodeToDelete = findNode(index)
            
            nodeToDelete.previous!.linkNext(nodeToDelete.next!)
            
            count -= 1
        }
    }
    
    internal func findNode(_ index: Int) -> DLNode<Int> {
        if count == 0 || index >= count || index < 0 { fatalError("index out of bounds: \(index)") }
                
        var node: DLNode<Int>!
        
        // search in left side, starting from root
        if index < count / 2 {
            node = root.next
            for _ in 0 ..< index {
                node = node.next
                print("finding node with index \(index)...")
            }
        }
        // search in right side, starting from end
        else {
            node = end
            for _ in 0 ..< count - 1 - index {
                node = node.previous
                print("finding node with index \(index)...")
            }
        }
                        
        return node
    }
    
}


// MARK: - cached linked list v1
class CachedList: MyLinkedList {
    var lastNode: DLNode<Int>!
    var lastIndex: Int!
    var lastIsValid: Bool = false
    
    override func findNode(_ index: Int) -> DLNode<Int> {
        var node: DLNode<Int>!
        
        if lastIsValid {
            let offset = index - lastIndex
            
            // find using last node
            if abs(offset) <= min(index, count - 1 - index) {
                node = lastNode
                
                if offset > 0 {
                    // positive offset case
                    for _ in 0 ..< offset { node = node.next }
                } else {
                    // negative offset case
                    for _ in offset ..< 0 { node = node.previous }
                }
            }
            // find using head or end
            else {
                node = super.findNode(index)
            }
        } else {
            node = super.findNode(index)
        }
        
        if index != lastIndex || !lastIsValid {
            lastNode = node
            lastIndex = index
            lastIsValid = true
        }
        
        return node
    }
    
    override func addAtHead(_ val: Int) {
        super.addAtHead(val)
        
        if lastIsValid {
            lastIndex += 1
        }
    }
    
    override func addAtIndex(_ index: Int, _ val: Int) {
        super.addAtIndex(index, val)
        
        if lastIsValid && index <= lastIndex {
            lastIndex += 1
        }
    }
    
    override func deleteTail() {
        super.deleteTail()
        
        if lastIsValid && count <= lastIndex {
            lastIsValid = false
        }
    }
    
    override func deleteHead() {
        super.deleteHead()
        
        if lastIsValid {
            lastIndex -= 1
        }
    }
    
    override func deleteAtIndex(_ index: Int) {
        super.deleteAtIndex(index)
        
        if lastIsValid {
            if index < lastIndex {
                lastIndex -= 1
            } else if index == lastIndex {
                lastIsValid = false
            }
        }
    }
    
}

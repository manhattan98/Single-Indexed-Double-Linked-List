//
//  DLNode.swift
//  Single Indexed Double Linked List
//
//  Created by Eremej Sumcenko on 14.04.2021.
//

import Foundation

// MARK: - double linked node
/**
 double linked node
 */
class DLNode<T> {
    var previous: DLNode<T>?
    var next: DLNode<T>?
    
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    func linkNext(_ next: DLNode<T>) {
        next.previous = self
        if next.next == nil  {
            next.next = self.next
        }
        self.next?.previous = next
        self.next = next
    }
    func linkNext(_ value: T) { linkNext(DLNode(value)) }
    
    func linkPrevious(_ prev: DLNode<T>) {
        prev.next = self
        if prev.previous == nil {
            prev.previous = self.previous
        }
        self.previous?.next = prev
        self.previous = prev
    }
    func linkPrevious(_ value: T) { linkPrevious(DLNode(value)) }
}

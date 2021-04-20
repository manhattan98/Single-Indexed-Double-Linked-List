//
//  Misc.swift
//  Single Indexed Double Linked List
//
//  Created by Eremej Sumcenko on 14.04.2021.
//

import Foundation

func printList<T>(head: SLNode<T>) {
    let prntStr: NSMutableString = ""
    var next: SLNode! = head
    repeat {
        var value: Any = next.value
        while let nodeValue = value as? DLNode<Int> { value = nodeValue.value }
        
        prntStr.append("(\(value)) -> ")
        next = next.next
    } while next != nil
    prntStr.deleteCharacters(in: _NSRange(location: prntStr.length - 4, length: 4))
    print(prntStr)
}

func printList<T>(head: DLNode<T>) {
    let prntStr: NSMutableString = ""
    var next: DLNode! = head
    repeat {
        var value: Any = next.value
        while let nodeValue = value as? DLNode<Int> { value = nodeValue.value }
        
        prntStr.append("(\(value)) -> ")
        next = next.next
    } while next != nil
    prntStr.deleteCharacters(in: _NSRange(location: prntStr.length - 4, length: 4))
    print(prntStr)
}

func printList<T>(tail: DLNode<T>) {
    let prntStr: NSMutableString = ""
    var prev: DLNode! = tail
    repeat {
        var value: Any = prev.value
        while let nodeValue = value as? DLNode<Int> { value = nodeValue.value }
        
        prntStr.append("(\(value)) <- ")
        prev = prev.previous
    } while prev != nil
    prntStr.deleteCharacters(in: _NSRange(location: prntStr.length - 4, length: 4))
    print(prntStr)
}

func printList(list: LinkedList, start: Int = 0) {
    let prntStr: NSMutableString = ""
    var i = 0
    var value = list.get(i)
    
    while value != -1 {
        prntStr.append("(\(i): \(value)), ")
        
        i += 1
        value = list.get(i)
    }
    
    print(prntStr)
}

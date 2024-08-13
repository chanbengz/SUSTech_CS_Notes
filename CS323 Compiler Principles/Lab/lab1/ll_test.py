#!/usr/bin/env python3
# encoding: utf-8

import ctypes
import os
import unittest

class LinkedList(ctypes.Structure):
    cwd = os.getcwd()
    lib_path = os.path.join(cwd, 'libll.so')
    lib = ctypes.CDLL(lib_path)
    def __init__(self, head=0):
        self.lib.linked_list_tostring.restype = ctypes.c_char_p
        self.lib.linked_list_init.restype = ctypes.POINTER(LinkedList)
        self.lib.linked_list_search_all.restype = ctypes.POINTER(LinkedList)
        if head == 0:
            self.head = self.lib.linked_list_init()
        else:
            self.head = head

    def __del__(self):
        self.lib.linked_list_free(self.head)

    def __str__(self):
        addr = self.lib.linked_list_tostring(self.head)
        raw = ctypes.cast(addr, ctypes.c_char_p).value
        return raw.decode()

    def size(self):
        return self.lib.linked_list_size(self.head)

    def append(self, val):
        self.lib.linked_list_append(self.head, val)

    def insert(self, val, index):
        self.lib.linked_list_insert(self.head, val, index)

    def delete(self, index):
        self.lib.linked_list_delete(self.head, index)

    def remove(self, val):
        self.lib.linked_list_remove(self.head, val)

    def remove_all(self, val):
        self.lib.linked_list_remove_all(self.head, val)

    def get(self, index):
        return self.lib.linked_list_get(self.head, index)

    def search(self, val):
        return self.lib.linked_list_search(self.head, val)

    def search_all(self, val):
        ptr = self.lib.linked_list_search_all(self.head, val)
        return LinkedList(ptr)


class LinkedListTest(unittest.TestCase):
    def test_basic(self):
        ll = LinkedList()
        ll.append(10)
        ll.append(20)
        self.assertEqual(str(ll), '10->20')
        self.assertEqual(ll.size(), 2)

    def test_insert(self):
        ll = LinkedList()
        ll.append(1)
        ll.append(2)
        ll.append(3)
        ll.insert(5, 2)
        ll.insert(6, 2)
        self.assertEqual(str(ll), '1->2->6->5->3')
        ll.insert(999, 999)
        self.assertEqual(ll.size(), 5)
        self.assertEqual(str(ll), '1->2->6->5->3')

    def test_delete(self):
        ll = LinkedList()
        ll.append(9)
        ll.append(6)
        ll.append(3)
        ll.append(0)
        ll.delete(2)
        self.assertEqual(str(ll), '9->6->0')
        ll.delete(-1)
        self.assertEqual(str(ll), '9->6->0')
        ll.delete(3)
        self.assertEqual(ll.size(), 3)

    def test_remove(self):
        ll = LinkedList()
        ll.append(1)
        ll.append(1)
        ll.append(1)
        ll.append(2)
        ll.append(3)
        ll.append(3)
        ll.append(2)
        self.assertEqual(str(ll), '1->1->1->2->3->3->2')
        ll.remove(2)
        self.assertEqual(str(ll), '1->1->1->3->3->2')
        ll.remove(2)
        self.assertEqual(str(ll), '1->1->1->3->3')
        ll.remove(-1)
        self.assertEqual(str(ll), '1->1->1->3->3')

    def test_remove_all(self):
        ll = LinkedList()
        ll.append(1)
        ll.append(2)
        for _ in range(100):
            ll.append(3)
        self.assertEqual(ll.size(), 102)
        ll.append(5)
        ll.remove_all(3)
        self.assertEqual(str(ll), '1->2->5')

    def test_get(self):
        ll = LinkedList()
        for i in range(100):
            ll.append(i)
        for i in range(200):
            val = ll.get(i)
            if i < 100:
                self.assertTrue(val == i)
            else:
                self.assertEqual(val, -0x80000000)

    def test_search(self):
        ll = LinkedList()
        for i in range(10):
            ll.append(i)
        for i in range(10):
            ll.append(i)
        for i in range(10):
            idx = ll.search(i)
            self.assertTrue(idx == i)
        self.assertEqual(ll.search(10), -1)

    def test_search_all(self):
        ll = LinkedList()
        for i in range(10):
            ll.append(i)
        for i in range(10):
            ll.append(9-i)
        ret = ll.search_all(7)
        self.assertEqual(str(ret), '7->12')
        ret = ll.search_all(101)
        self.assertEqual(ret.size(), 0)



if __name__ == "__main__":
    unittest.main()

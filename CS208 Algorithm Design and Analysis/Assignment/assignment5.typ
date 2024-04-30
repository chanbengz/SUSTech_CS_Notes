#import "template.typ": *

#show: project.with(
  title: "Algorithm Assignment 5",
  authors: (
    (
      name: "陈贲(12212231)",
    ),
  ),
)

#problem[
  You are interested in analyzing some hard-to-obtain data from two separate databases. Each database contains $n$ numerical values—so there are $2n$ values total—and you may assume that no two values are the same. You'd like to determine the median of this set of $2n$ values, which we will define here to be the $n^(t h)$ smallest value.

  However, the only way you can access these values is through queries to the databases. In a single query, you can specify a value $k$ to one of the two databases, and the chosen database will return the $k^(t h)$ smallest value that it contains. Since queries are expensive, you would like to compute the median using as few queries as possible. Give an algorithm that finds the median value using at most $O(log n)$ queries.
]

#solution[
  #set enum(numbering: "1.")
  Suppose $A$ and $B$ are the two databases and $A(i), B(i)$ denotes the query to the $i^{t h}$ smallest element in $A$ and $B$ respectively. We can use the following algorithm to find the median.
  + Let $k = ⌈n slash 2⌉$, then $A(k)$ and $B(k)$ will be the median of each database.
  + Without lost of generality, assume $A(k) < B(k)$, then $B(k)$ will be at least the $2k^(t h)$ smallest element in the combined database. Since $2k gt.eq n$, we search the left half of $B$.
  + And similarly, since the left half of $A$ is less than $B(k)$, it is also less than the $n + 1$ smallest element in the combined database. So we search the right half of $A$.
  + To do these, we use two arguments $a, b$ to denote the base index of the search range of $A$ and $B$, $n$ to denote the size of search region. So, we query $A(a + ⌈n slash 2⌉)$ and $B(b + ⌈n slash 2⌉)$, and compare the two values each iteration.
  The pseudocode of the algorithm is shown below:
  ```python
  def Find_Median(n, a, b):
    if n == 1:
      return min(A(a), B(b))
    k <- ceil(n / 2)
    if A(a + k) < B(b + k):
      return Find_Median(n - k, a + k, b)
    else:
      return Find_Median(n - k, a, b + k)
  ```
  The algorithm will queries $T(n) = T(n slash 2) + 2$ times, which is $T(n) = 2log n = O(log n)$
]

#problem[
  Recall the problem of finding the number of inversions. As in the text, we are given a sequence of $n$ numbers $a_1, dots, a_n$ which we assume are all distinct, and we define an inversion to be a pair $i < j$ such that $a_i > a_j$

  We motivated the problem of counting inversions as a good measure of how different two orderings are. However, one might feel that this measure is too sensitive. Let's call a pair a significant inversion if $i < j$ and $a_i > 2a_j$. Give an $O(n log n)$ algorithm to count the number of significant inversions between two orderings.
]

#solution[
  The solution is similar to the merge sort algorithm. We count the number of significant inversions in the merge step. The only change here is the counting step. For each recursion, after finish sorting the two parts, since if $l[i] > 2 times r[j]$, the elements after $i$ in the left part will be also larger than twice $r[j]$, where $l[], r[]$ are the left and right subarrays. And the number of significant inversions can be added up. The pseudocode of the algorithm is shown below:
  ```c
  long long cnt, a[N];

  void merge_sort(int l ,int r){
      if (l == r) return;     // base case
      int mid = (l + r) >> 1;
      merge_sort(l , mid);    // sort left part
      merge_sort(mid + 1, r); // sort right part
      // count significant inversions
      int i = l , j = mid + 1, k = 0;
      while (i <= mid && j <= r){
          if (a[i] > 2 * a[j]) {
              cnt += mid - i + 1;
              j++ 
          } else i++;
      }
      // merge two parts
      i = l , j = mid + 1, k = 0;
      int t[r - l + 1];
      while (i <= mid && j <= r){
          if (a[i] <= a[j]) t[k++] = a[i++];
          else t[k++] = a[j++];
      }
      while (i <= mid) t[k++] = a[i++];
      while (j <= r) t[k++] = a[j++];
      for(int x = 0; x < r - l + 1; x++) a[l + x] = t[x];
  }
  ```
  The algorithm runs in $T(n) = 2T(n slash 2) + O(n)$, which is $T(n) = O(n log n)$ time.
]
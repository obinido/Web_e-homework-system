/*
Navicat MySQL Data Transfer

Source Server         : QQAI
Source Server Version : 80032
Source Host           : localhost:3306
Source Database       : exercise_web

Target Server Type    : MYSQL
Target Server Version : 80032
File Encoding         : 65001

Date: 2023-03-31 10:02:21
*/

SET FOREIGN_KEY_CHECKS=0;
# CREATE DATABASE /*!32312 IF NOT EXISTS*/ exercise_web /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE jol;

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_email` varchar(50) NOT NULL,
  `exercise_id` int NOT NULL,
  `answer` text,
  `is_right` int DEFAULT '-1',
  `solution_id` int,
  `language` int,
  `result` int,
  PRIMARY KEY (`id`),
  KEY `user_email` (`user_email`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO answer VALUES ('78', '2023-03-15 15:17:11', 'jiaxinliang@cug.edu.cn', '80', 'B', '100', null, '-1', '-1');
INSERT INTO answer VALUES ('79', '2023-03-15 16:42:08', 'jiaxinliang@cug.edu.cn', '81', 'D', '100', null, '-1', '-1');
INSERT INTO answer VALUES ('80', '2023-03-15 16:42:22', 'jiaxinliang@cug.edu.cn', '88', '1', '100', null, '-1', '-1');
INSERT INTO answer VALUES ('81', '2023-03-15 16:42:37', 'jiaxinliang@cug.edu.cn', '82', 'C', '100', null, '-1', '-1');
INSERT INTO answer VALUES ('82', '2023-03-15 16:42:44', 'jiaxinliang@cug.edu.cn', '83', 'C', '100', null, '-1', '-1');
INSERT INTO answer VALUES ('83', '2023-03-15 16:42:57', 'jiaxinliang@cug.edu.cn', '257', 'B', '100', null, '-1', '-1');
INSERT INTO answer VALUES ('85', '2023-04-06 21:02:57', 'jiaxinliang@cug.edu.cn', '1002', '#include <iostream>\r\nusing namespace std;\r\nint main(){\r\n    int a,b;\r\n    while(cin >> a >> b)\r\n        cout << a+b << endl;\r\n	return 0;}','100','1011','1','4');
INSERT INTO answer VALUES ('86', '2023-04-06 21:14:49', 'jiaxinliang@cug.edu.cn', '1002', '# coding=utf-8\r\nn = int(input())\r\ns = 0\r\nfor i in range(1,n+1,2):\r\n    s += i\r\nprinttttttttttt(s)', '0', '1012', '6', '10');
INSERT INTO answer VALUES ('87', '2023-04-06 21:17:58', 'jiaxinliang@cug.edu.cn', '1002', 'import java.util.*;\r\npublic class Main{\r\n	public static void main(String args[]){\r\n		Scanner cin = new Scanner(System.in);\r\n		int a, b;\r\n		while (cin.hasNext()){\r\n			a = cin.nextInt(); b = cin.nextInt();\r\n			System.out.println(1);\r\n		}\r\n	}\r\n}', '0', '1013', '3', '6');

-- ----------------------------
-- Table structure for `exercise`
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `knowledge_id` int NOT NULL,
  `homework_id` int DEFAULT NULL,
  `content` longtext,
  `answer` text,
  `type` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowledge_id` (`knowledge_id`),
  KEY `homework_id` (`homework_id`),
  CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge` (`id`),
  CONSTRAINT `homework_id` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES ('15', '20', null, 'Using Figure 2.2 as a model, illustrate the operation of `INSERTION-SORT` on the array `[31; 41; 59; 26; 41; 58]`.', '```\r\n[31, 41_1, 59, 26, 41_2, 58] // To differentiate from the two \"41\", we use \"41_1\" and \"41_2\"\r\n[26, 31, 41_1, 59, 41_2, 58]\r\n[26, 31, 41_1, 41_2, 59, 58]\r\n[26, 31, 41_1, 41_2, 58, 59]\r\n```', '0');
INSERT INTO `exercise` VALUES ('16', '20', null, 'Rewrite the `INSERTION-SORT` procedure to sort into nonincreasing instead of nondecreasing order.', 'We can change the `WHILE` statement to:\r\n```\r\nWHILE i > 0 AND A[i] < key\r\n```', '0');
INSERT INTO `exercise` VALUES ('17', '20', null, 'Write pseudocode for linear search, which scans through the sequence, looking for a value `v` in an array. Using a loop invariant, prove that your algorithm is correct. Make sure that your loop invariant fulfills the three necessary properties.', 'Pseudocode\r\n```\r\nLINEAR-SEARCH(A, v)\r\n    i <- NIL\r\n    FOR k <- 1 to A.length\r\n        IF A[k] = v\r\n            i <- k\r\n            RETURN i\r\n```\r\n\r\nLoop Invariant: Nums between 0 and k-1 don\'t equal v.\r\n\r\n1. Initialization: When k = 1, there is no num between 0 and k-1. Thus, RIGHT!\r\n2. Loop: [0, (k-1)-1] -> A[k] don\'t equal v -> [0, k-1]\r\n3. Termination: \r\n   1. case 1: A[k] = v, terminate.\r\n   2. case 2: k = A.length + 1, and there is no num in [0, A.length]. Thus, i = NIL.', '0');
INSERT INTO `exercise` VALUES ('18', '20', null, 'Consider the problem of adding two n-bit binary integers, stored in two n-element arrays A and B. The sum of the two integers should be stored in binary form in an n + 1-element array C . State the problem formally and write pseudocode for adding the two integers.', '```\r\nInput: A and B, 2 n-bit binary integers\r\nOutput: C = A + B, a (n+1)-bit binary integer\r\n\r\nSUM-OF-2-BINARYINT(A, B)\r\n    FOR k <- 1 to n+1\r\n        C[k] = 0\r\n    FOR k <- 1 to n\r\n        IF A[k] + B[k] = 0\r\n            C[k+1] <- 0\r\n        ELSE IF A[k] + B[k] = 2\r\n            C[k] <- C[k] + 1\r\n        ELSE\r\n            IF C[k+1] = 0\r\n                C[k+1] <- 1\r\n            ELSE\r\n                C[k+1] <- 0\r\n                C[k] <- 1\r\n```', '0');
INSERT INTO `exercise` VALUES ('19', '20', null, 'Express the function $n^3 - 2n^2 + 1$ in terms of $\\Theta$-notation.', '$\\Theta(n^3)$', '0');
INSERT INTO `exercise` VALUES ('20', '20', null, 'How can we modify almost any algorithm to have a good best-case running time?', '> How can we modify almost any algorithm to have a good best-case running time?\r\n\r\nI don\'t understand what does the question mean. So I refer to the answer on Github.\r\n\r\n> \"We can design any algorithm to treat its best-case scenario as a special case and return a predetermined solution.\"\r\n\r\n Click [here](https://atekihcan.github.io/CLRS/02/E02.02-04/) to see more.', '0');
INSERT INTO `exercise` VALUES ('21', '20', null, 'Consider linear search again (see Exercise 2.1-3). How many elements of the input sequence need to be checked on the average, assuming that the element being searched for is equally likely to be any element in the array? How about in the worst case? What are the average-case and worst-case running times of linear search in $\\Theta$-notation? Justify your answers.', 'Average case runtime: (1 + 2 + ... + n) / n = Theta(n)\r\n\r\nWorst case runtime: n = Theta(n)', '0');
INSERT INTO `exercise` VALUES ('22', '20', null, 'Consider sorting n numbers stored in array A by first finding the smallest element of A and exchanging it with the element in A[1]. Then find the second smallest element of A, and exchange it with A[2]. Continue in this manner for the first n - 1 elements of A. Write pseudocode for this algorithm, which is known as selection sort. What loop invariant does this algorithm maintain? Why does it need to run for only the first n - 1 elements, rather than for all n elements? Give the best-case and worst-case running times of selection sort in $\\Theta$-notation.', '```\r\nSELECTION-SORT(A)\r\n    FOR k <- 1 to A.length-1\r\n        min <- infinity\r\n        FOR i <- k to A.length\r\n            IF min < A[i]\r\n                min <- A[i]\r\n                imin <- i\r\n        EXCHANGE A[k] with A[imin]\r\n```\r\n\r\nLoop Invariant: The first k elements of the array processed are the kth smallest elements of the original array. So they are ordered.\r\n\r\nWhen k = A.length - 1, the first A.length - 1 elements of the array processed are the kth smallest elements of the original array. Therefore, the A.length element of the array is exactly the largest.\r\n\r\nBest case runtime: When the array is ordered, we also have to search the array for the minimal element. So, the runtime is also Theta(n^2)\r\n\r\nWorst case runtime: Theta(n^2)', '0');
INSERT INTO `exercise` VALUES ('23', '22', null, 'Using Figure 2.4 as a model, illustrate the operation of merge sort on the array `A = [3; 41; 52; 26; 38; 57; 9; 49]`.', '```\r\n[3, 41, 52, 26, 38, 57, 9, 49]\r\nMS(A, 1, 8)\r\n    MS(A, 1, 4)\r\n        MS(A, 1, 2)\r\n            MS(A, 1, 1)\r\n            MS(A, 2, 2)\r\n            M(A, 1, 1, 2)\r\n            [3, 41, 52, 26, 38, 57, 9, 49]\r\n        MS(A, 3, 4)\r\n            [3, 41, 26, 52, 38, 57, 9, 49]\r\n        M(A, 1, 2, 4)\r\n        [3, 26, 41, 52, 38, 57, 9, 49]\r\n    MS(A, 5, 8)\r\n        [3, 26, 41, 52, 9, 38, 49, 57]\r\n    M(A, 1, 4, 8)\r\n    [3, 9, 26, 38, 41, 49, 52, 57]\r\n```', '0');
INSERT INTO `exercise` VALUES ('24', '22', null, 'Rewrite the `MERGE` procedure so that it does not use sentinels, instead stopping once either array L or R has had all its elements copied back to A and then copying the remainder of the other array back into A.', '```\r\nMERGE(A, p, q, r)\r\n    n1 <- q-p+1\r\n    n2 <- r-q\r\n    FOR i <- 1 to n1\r\n        L[i] <- A[p+i-1]\r\n    FOR j <- 1 to n2\r\n        R[i] <- A[q + j]\r\n    i <- 1, j <- 1\r\n    FOR k <- p to r\r\n        IF i < n1 and (j >= n2 or L[i] <= R[j])\r\n            A[k] <- L[i]\r\n            i <- i + 1\r\n        ELSE IF j < n2 && (i >= n1 || L[i] > R[j])\r\n            A[k] <- R[j]\r\n            j <- j + 1\r\n```', '0');
INSERT INTO `exercise` VALUES ('25', '22', null, 'Observe that the while loop of lines 5–7 of the `INSERTION-SORT` procedure in Section 2.1 uses a linear search to scan (backward) through the sorted subarray `A = [1, ..., j - 1]`. Can we use a binary search (see Exercise 2.3-5) instead to improve the overall worst-case running time of insertion sort to $\\Theta(n\\lg n)$?', 'No. When we find the position where we should insert the number after the sorted subarray, we also need to move the elements after the position. So the runtime is Theta(n^2) also.', '0');
INSERT INTO `exercise` VALUES ('26', '22', null, 'Referring back to the searching problem (see Exercise 2.1-3), observe that if the sequence A is sorted, we can check the midpoint of the sequence against v and eliminate half of the sequence from further consideration. The binary search algorithm repeats this procedure, halving the size of the remaining portion of the sequence each time. Write pseudocode, either iterative or recursive, for binary search. Argue that the worst-case running time of binary search is $\\Theta(\\lg n)$.', '```\r\nInput: A sorted array A and the value v to search\r\nOutput: The index s.t. A[index] = v\r\n\r\nBINARY-SEARCH(A, v, begin, end)\r\n    IF begin = end\r\n        IF A[begin] = v\r\n            RETURN begin\r\n        ELSE RETURN NIL\r\n    ELSE\r\n        median <- floor((begin + end) / 2)\r\n        IF v <= A[median]\r\n            RETURN BS(A, v, begin, median)\r\n        ELSE\r\n            RETURN BS(A, v, median + 1, end)\r\n```\r\n\r\nT(n) = T((n-1)/2) + Theta(1) for n > 1, and T(1) = 1. Thus, T(n) = lgn.', '0');
INSERT INTO `exercise` VALUES ('27', '22', null, 'Use mathematical induction to show that when n is an exact power of 2, the solution of the recurrence\r\n$$\r\nT(n) = \\begin{cases}\r\n2, n = 2\\\\\r\n2T(n/2) + n, n = 2^k\r\n\\end{cases}\r\n$$\r\nis $T(n) = n\\lg n$.', 'When $n = 2^k$, \r\n\r\n$$T(n) = T(2^k) = 2T(2^{k-1}) + 2^k = \\cdots = 2^{k-1}T(2) + (k-1)2^k = k\\cdot 2^k = n\\lg n.$$', '0');
INSERT INTO `exercise` VALUES ('28', '22', null, 'We can express insertion sort as a recursive procedure as follows. In order to sort A[1, ..., n], we recursively sort A[1, ..., n-1] and then insert A[n] into the sorted array A[1, ..., n-1]. Write a recurrence for the running time of this recursive version of insertion sort.', 'T(n) = T(n-1) + Theta(n) for n > 1, and T(1) = 1.', '0');
INSERT INTO `exercise` VALUES ('29', '22', null, 'Describe a $\\Theta (n\\lg n)$-time algorithm that, given a set S of n integers and another integer x, determines whether or not there exist two elements in S whose sum is exactly x.', 'I search this question on Stack Overflow and get the answer. To see the detail please click [here](https://stackoverflow.com/questions/29232127/algorithm-for-given-a-set-s-of-n-integers-and-another-integer-x-determine-whet).\r\n\r\n```\r\nAlgo(S, x)\r\n    MERGESORT(A)\r\n    FOR i <- 1 to S.length\r\n        index <- BINARY-SERCH(S, x - S[i])\r\n        if index != NIL AND index != i\r\n            return ture\r\n    return false\r\n```', '0');
INSERT INTO `exercise` VALUES ('30', '21', null, 'Use the master method to give tight asymptotic bounds for the\r\nfollowing recurrences.\r\n1. $T({n})=4 T\\left(\\frac{n}{2}\\right)+n$;\r\n2. $T({n})=4 T\\left(\\frac{n}{2}\\right)+n^{2}$;\r\n3. $T({n})=4 T\\left(\\frac{n}{2}\\right)+n^{3}$;\r\n4. $T({n})=T\\left(\\frac{9 n}{10}\\right)+n$.', '### a.\r\n\r\n$$\r\n\\log _2 4 = 2\\\\\r\nn = O(n^{2-\\epsilon}), \\epsilon \\leq 1\\\\\r\n\\Rightarrow T(n) = \\Theta(n^2)\r\n$$\r\n\r\n### b.\r\n\r\n$$\r\n\\log _2 4 = 2\\\\\r\nn^2 = \\Theta (n^2)\\\\\r\n\\Rightarrow T(n) = \\Theta(n^2\\log n)\r\n$$\r\n\r\n### c.\r\n\r\n$$\r\n\\log _2 4 = 2\\\\\r\nn^3 = \\Omega(n^{2+\\epsilon}), \\epsilon \\leq 1\\\\\r\n4(\\frac{n}{2})^3 \\leq cn^3, c \\geq \\frac{1}{2}\\\\\r\n\\Rightarrow T(n) = \\Theta(n^3)\r\n$$\r\n\r\n### d.\r\n\r\n$$\r\n\\log _{\\frac{10}{9}} 1 = 0\\\\\r\nn = \\Omega(n^{0+\\epsilon}), \\epsilon \\leq 1\\\\\r\n\\frac{9n}{10} \\leq cn, c \\geq \\frac{9}{10}\\\\\r\n\\Rightarrow T(n) = \\Theta(n)\r\n$$', '0');
INSERT INTO `exercise` VALUES ('31', '21', null, 'The recurrence $T(n)=7 T\\left(\\frac{n}{2}\\right)+n^{2}$ describe the running time of an algorithm A. The competing algorithm A\' has a running time of $T^{\\prime}(n)=$ $a T^{\\prime}\\left(\\frac{n}{4}\\right)+n^{2} .$ What is the largest integer value for $a$ such that A\' is asymptotically faster than A?', 'A:\r\n$$\r\n\\log _2 7 \\approx 2.80\\\\\r\nn^{2} = O(n^{\\log _2 7-\\epsilon}), \\epsilon \\leq \\log _2 7 - 2\\\\\r\n\\Rightarrow T(n) = \\Theta(n^{\\log _2 7})\r\n$$\r\n\r\nA\':\r\n\r\n$$\r\n\\begin{cases}\r\n    \\log _4 a > 2, n^2 = O(n^{\\log _4 a - \\epsilon}),T(n) = \\Theta(n^{\\log _4 a})\\\\\r\n    \\log _4 a = 2, n^2 = \\Theta(n^{\\log _4 a}),T(n) = \\Theta(n^{2}\\log n)\\\\\r\n    \\log _4 a < 2, n^2 = \\Omega(n^{\\log _4 a + \\epsilon}),T(n) = \\Theta(n^{2})\\\\\r\n\\end{cases}\r\n$$\r\n\r\nIf A\' is asymptotically faster than A,\r\n$$\r\n\\log _4 a < \\log _2 7\\\\\r\n\\Rightarrow a < 49\r\n$$\r\nSo the largest integer value for $a$ is 48.', '0');
INSERT INTO `exercise` VALUES ('32', '24', null, 'What are the minimum and maximum numbers of elements in a heap of height h?', 'min = $1 + ... + 2^(h-1) + 1 = 2^h$\r\n\r\nmax = $1 + ... + 2^h = 2^(h+1) - 1$', '0');
INSERT INTO `exercise` VALUES ('33', '24', null, 'Show that an n-element heap has height floor(lg n).', 'min <= n <= max\r\n\r\nSo, lg(n+1) - 1 <= h <= lgn. h = floor(lgn).', '0');
INSERT INTO `exercise` VALUES ('34', '24', null, 'Show that in any subtree of a max-heap, the root of the subtree contains the largest value occurring anywhere in that subtree.', 'According to the max heap property, \r\n\r\nA[root] >= A[child(root)] >= A[child(child(root))] >= ... >= A[leaf].\r\n\r\nSo, the root of the max heap and its subtree contains the largest value.', '0');
INSERT INTO `exercise` VALUES ('35', '24', null, 'Where in a max-heap might the smallest element reside, assuming that all elements are distinct?', 'Among all leaf nodes.', '0');
INSERT INTO `exercise` VALUES ('36', '24', null, 'Is an array that is in sorted order a min-heap?', '0', '2');
INSERT INTO `exercise` VALUES ('37', '24', null, 'Is the array with values `[23; 17; 14; 6; 13; 10; 1; 5; 7; 12]` a max-heap?', '1', '2');
INSERT INTO `exercise` VALUES ('38', '24', null, 'Show that, with the array representation for storing an n-element heap, the leaves are the nodes indexed by `floor(n/2) + 1, floor(n/2) + 2, ..., n`.', 'Assume that the number of all the nodes are: \r\n$$\r\nN = 2^{d} - 1 + l, l\\in [1, 2^{d}]\r\n$$\r\n\r\nThe number of nodes having leaves in the d-1 level are floor(l / 2). The number of leaves are l + 2^(d-1) - floor(l / 2).\r\n\r\nSo the index of nodes which are not leaves are from 1 to:\r\n$$\r\nN - (l + 2^{d-1} - {\\rm floor}(l / 2)) = 2^{d-1} + {\\rm floor}(l / 2) - 1\\\\\r\n{\\rm floor}(N / 2) = 2^{d-1} + {\\rm floor}(l/2) - {\\rm floor}(1/2)\r\n$$\r\n\r\nTherefore, we prove that the index of leaves start from floor(N/2) + 1.', '0');
INSERT INTO `exercise` VALUES ('39', '24', null, 'Using Figure 6.2 as a model, illustrate the operation of `MAX-HEAPIFY(A, 3)` on the array `A = [27;17;3;16;13;10;1;5;7;12;4;8;9;0]`.', 'We would exchange 3 with 10 and then with 9.', '0');
INSERT INTO `exercise` VALUES ('40', '24', null, 'Starting with the procedure `MAX-HEAPIFY`, write pseudocode for the procedure `MIN-HEAPIFY(A, i)`, which performs the corresponding manipulation on a min- heap. How does the running time of `MIN-HEAPIFY` compare to that of `MAX- HEAPIFY`?', 'I modified my code for max heap to the one for min heap. I think the runtime will stay unchanged.', '0');
INSERT INTO `exercise` VALUES ('41', '24', null, 'What is the effect of calling `MAX-HEAPIFY(A, i)` when the element `A[i]` is larger than its children?', 'The iteration will stop.', '0');
INSERT INTO `exercise` VALUES ('42', '24', null, 'What is the effect of calling `MAX-HEAPIFY[A,i]` for i > A.heap-size/2?', 'This means 2i > A.size, so largest = i.', '0');
INSERT INTO `exercise` VALUES ('43', '24', null, 'The code for `MAX-HEAPIFY` is quite efficient in terms of constant factors, except possibly for the recursive call in line 10, which might cause some compilers to produce inefficient code. Write an efficient `MAX-HEAPIFY` that uses an iterative control construct (a loop) instead of recursion.', '略。', '0');
INSERT INTO `exercise` VALUES ('44', '24', null, 'Show that the worst-case running time of `MAX-HEAPIFY` on a heap of size n is $\\Omega(\\lg n)$. (*Hint*: For a heap with n nodes, give node values that cause `MAX-HEAPIFY` to be called recursively at every node on a simple path from the root down to a leaf.)', 'The smallest number is at root. So T(n) = T(n/2) + Theta(1). So T(n) = lgn.', '0');
INSERT INTO `exercise` VALUES ('45', '24', null, 'Using Figure 6.3 as a model, illustrate the operation of `BUILD-MAX-HEAP` on the array `A = [5;3;17;10;84;19;6;22;9]`.', 'We should call from MAX-HEAPIFY(A, 4) to MAX-HEAPIFY(A, 1).', '0');
INSERT INTO `exercise` VALUES ('46', '24', null, 'Why do we want the loop index i in line 2 of `BUILD-MAX-HEAP` to decrease from `A.length/2` to 1 rather than increase from 1 to `A.length/2`?', 'The condition of MAX-HEAPIFY(A, i) is the children of i is the root of a max subheap.', '0');
INSERT INTO `exercise` VALUES ('47', '24', null, 'Show that there are at most $n/(2^{h+1})$ nodes of height h in any n-element heap.', 'The height of a node is the number of edges on the longest downward path between the node and a leaf. [[1]](https://stackoverflow.com/questions/28523987/there-are-at-most-ceilingn-2h1-nodes-of-height-h-in-any-n-element-tree)\r\n\r\nAs stated in 6.1-7, the number of leaves is $l + 2^{d-1} - {\\rm floor}(l / 2)$, namely $N - {\\rm floor}(N / 2) = {\\rm ceil}(N / 2)$. Here, h = 0.\r\n\r\nWhen the height get larger, number of nodes at h level = ceil(number of nodes at h+1 level / 2) as each parent has at most 2 children. So, number of nodes at h level is at most ceil(n / 2^(h+1)).', '0');
INSERT INTO `exercise` VALUES ('48', '24', null, 'Using Figure 6.4 as a model, illustrate the operation of HEAPSORT on the array `A = [5;13;2;25;7;17;20;8;4]`.', '略。', '0');
INSERT INTO `exercise` VALUES ('49', '24', null, 'Argue the correctness of HEAPSORT using the following loop invariant.', 'Initialization: i = A.length, there\'s no num in A[i+1, ..., n].\r\n\r\nLoop: As proved in 6.1-3, the root of a max heap contains the largest num. By exchange, we move the largest n-i nums to the tail **one by one**.\r\n\r\nTerminalization: i = 1, there\'s only one num in A[1, ..., i]. It\'s the smallest.', '0');
INSERT INTO `exercise` VALUES ('50', '24', null, 'What is the running time of HEAPSORT on an array A of length n that is already sorted in increasing order? What about decreasing order?', 'The runtime of the 2, I think, is both Theta(nlgn). For the 2 cases, the BUILD-HEAP() function consumes O(n), but the one running on an sorted array in a decreasing order may be faster than increasing. But it is the same that in the loop which MAX-HEAPIFY() is called, each one will operate full lgk operations.[[2]](https://walkccc.me/CLRS/Chap06/6.4/)\r\n\r\nSo, the runtime is:\r\n$$\r\n\\sum \\limits _{k = 1}^{n - 1} {\\lg k} = \\lg {((n-1)!)} = \\Theta(n\\lg n)\r\n$$', '0');
INSERT INTO `exercise` VALUES ('51', '24', null, 'Show that the worst-case running time of HEAPSORT is $\\Omega(n \\lg n)$.', 'If the heap built is a sorted one in a decreasing order, the runtime is Theta(nlgn).', '0');
INSERT INTO `exercise` VALUES ('52', '24', null, 'Show that when all elements are distinct, the best-case running time of HEAPSORT is $\\Omega(n \\lg n)$.', 'It\'s claimed that it is evil to put this an exercise...[[3]](https://walkccc.me/CLRS/Chap06/6.4/) So I give it up. It is analized in a Ph.D paper. (Schaffer and Sedgewick, 1993)', '0');
INSERT INTO `exercise` VALUES ('53', '23', null, 'What value of q does PARTITION return when all elements in the array `A[p, ..., r]` have the same value? Modify PARTITION so that `q = floor((p + r) / 2)` when all elements in the array `A[p, ..., r]` have the same value.', 'The `PARTITION` function will return r.\r\n\r\nWe can use a virable `count` to record the number of numbers equaling `x`.\r\n\r\n```cpp\r\nif (A[j] == x)\r\n{\r\n    if (count % 2 == 0)\r\n    {\r\n        continue;\r\n    }\r\n}\r\nif (A[j] <= x)\r\n{\r\n    // your code here\r\n}\r\n```', '0');
INSERT INTO `exercise` VALUES ('54', '23', null, 'Give a brief argument that the running time of PARTITION on a subarray of size n is $\\Theta(n)$.', 'The loop\'s runtime is Theta(n), and other statements\' runtime is Theta(1). So the runtime is Theta(n),', '0');
INSERT INTO `exercise` VALUES ('55', '23', null, 'How would you modify QUICKSORT to sort into nonincreasing order?', 'Just change the inequality sign.', '0');
INSERT INTO `exercise` VALUES ('56', '23', null, 'Using Figure 7.1 as a model, illustrate the operation of PARTITION on the array `A = [13;19;9;5;12;8;7;4;21;2;6;11]`.', 'The loop\'s runtime is Theta(n), and other statements\' runtime is Theta(1). So the runtime is Theta(n).', '0');
INSERT INTO `exercise` VALUES ('57', '23', null, 'Use the substitution method to prove that the recurrence $T(n) = T(n - 1) + \\Theta(n)$ has the solution $T(n) = \\Theta(n^2)$, as claimed at the beginning of Section 7.2.', 'We assume $T(n) \\leq cn^2$ when $n \\leq N$. Then when $n > N$,\r\n$$\r\nT(n) = T(n-1) + tn \\leq c(n-1)^2 + tn = cn^2 - (2c-t)n + c\\\\\r\ncn^2 - (2c-t)n + c \\leq cn^2\\\\\r\n\\Leftrightarrow c \\geq \\frac{tn}{2n-1}\\\\\r\n\\Leftarrow c \\geq t\r\n$$\r\n\r\nWe assume $T(n) \\geq cn^2$ when $n \\leq N$. Then when $n > N$,\r\n$$\r\nT(n) = T(n-1) + tn \\geq c(n-1)^2 + tn = cn^2 - (2c-t)n + c\\\\\r\ncn^2 - (2c-t)n + c \\geq cn^2\\\\\r\n\\Leftrightarrow c \\leq \\frac{tn}{2n-1}\\\\\r\n\\Leftarrow c \\leq \\frac{t}{2}\r\n$$', '0');
INSERT INTO `exercise` VALUES ('58', '23', null, 'What is the running time of QUICKSORT when all elements of array A have the same value?', 'T(n) = T(n-1) + Theta(n). T(n) = Theta(n^2).', '0');
INSERT INTO `exercise` VALUES ('59', '23', null, 'Show that the running time of QUICKSORT is $\\Theta(n^2)$ when the array A contains distinct elements and is sorted in decreasing order.', 'Just as above, T(n) = Theta(n^2).', '0');
INSERT INTO `exercise` VALUES ('60', '23', null, 'Banks often record transactions on an account in order of the times of the transac- tions, but many people like to receive their bank statements with checks listed in order by check number. People usually write checks in order by check number, and merchants usually cash them with reasonable dispatch. The problem of converting time-of-transaction ordering to check-number ordering is therefore the problem of sorting almost-sorted input. Argue that the procedure INSERTION-SORT would tend to beat the procedure QUICKSORT on this problem.', 'In case of almost sorted input, `IS`\'s best case consume Theta(n) while `QS`\'s worst case consume Theta(n^2).\r\n\r\nWe can also use number of inversed pairs to explain it.[[1]](https://walkccc.me/CLRS/Chap07/7.2/) If `PARTITION` does pick a pivot that does not participate in an inversion, it will produce an empty partition.', '0');
INSERT INTO `exercise` VALUES ('61', '23', null, 'Why do we analyze the expected running time of a randomized algorithm and not its worst-case running time?', 'When we run the algorithm, we seldom come across the worst case and the best case.', '0');
INSERT INTO `exercise` VALUES ('62', '23', null, 'When RANDOMIZED-QUICKSORT runs, how many calls are made to the random- number generator RANDOM in the worst case? How about in the best case? Give your answer in terms of $\\Theta$-notation.', 'We should choose a number not the smallest or largest $\\alpha n$ numbers. So $P = \\frac{n - 2\\alpha n}{n} = 1 - 2\\alpha$.[[2]](https://walkccc.me/CLRS/Chap07/7.2/)', '0');
INSERT INTO `exercise` VALUES ('63', '23', null, 'Argue that for any constant $0 \\leq \\alpha \\leq 1/2$, the probability is approximately $1 - 2\\alpha$, that on a random input array, PARTITION produces a split more balanced than $1 - \\alpha$ to$\\alpha$.', 'We should choose a number not the smallest or largest $\\alpha n$ numbers. So $P = \\frac{n - 2\\alpha n}{n} = 1 - 2\\alpha$.[[2]](https://walkccc.me/CLRS/Chap07/7.2/)', '0');
INSERT INTO `exercise` VALUES ('64', '23', null, 'Show that in the recurrence\r\n$T(n)=\\max _{0 \\leq q \\leq n-1}(T(q)+T(n-q-1))+\\Theta(n)$\r\n$T(n)=\\Omega\\left(n^{2}\\right)$.', 'We assume $T(n) \\geq cn^2$ when $n \\leq N$. Then when $n > N$,\r\n$$\r\nT(n) = \\max _{q \\in [0,n-1]} \\{T(q) + T(n - q - 1)\\} + tn \\\\\r\n= c\\max _{q \\in [0,n-1]} \\{q^2 + (n - q - 1)^2\\} + tn = cn^2 - (2c-t)n + c\\\\\r\ncn^2 - (2c-t)n + c \\geq cn^2\\\\\r\n\\Leftrightarrow c \\leq \\frac{tn}{2n-1}\\\\\r\n\\Leftarrow c \\leq \\frac{t}{2}\r\n$$', '0');
INSERT INTO `exercise` VALUES ('65', '23', null, 'Show that quicksort\'s best-case running time is $\\Omega(n \\lg n)$.', 'We assume $T(n) \\geq cn\\lg n$ when $n \\leq N$. Then when $n > N$,\r\n$$\r\nT(n) = \\min _{q \\in [0,n-1]} \\{T(q) + T(n - q - 1)\\} + tn \\\\\r\n= c\\min _{q \\in [0,n-1]} \\{q\\lg q + (n-q-1)\\lg (n-q-1)\\} + tn = c(n-1)\\lg(\\frac{n-1}{2}) + tn\\\\\r\nc(n-1)\\lg(\\frac{n-1}{2}) + tn - cn\\lg n = c(n\\lg{\\frac{n-1}{2n}} - \\lg{\\frac{n-1}{2}}) +tn \\geq 0\\\\\r\n\\Leftrightarrow c \\leq \\frac{tn}{\\lg{\\frac{n-1}{2}} - n\\lg{\\frac{n-1}{2n}}}\\\\\r\nc \\leq \\frac{tn}{\\lg{\\frac{n-1}{2}} - n\\lg{\\frac{n-1}{2n}}}\\\\\r\n\\Leftarrow c \\leq \\frac{t}{\\lg{3}}\r\n$$', '0');
INSERT INTO `exercise` VALUES ('66', '23', null, 'Show that the expression $q^{2}+(n-q-1)^{2}$ achieves a maximum over $q=0,1, \\ldots, n-1$ when $q=0$ or $q=n-1$.', 'We can simply apply what we learnt in Calculus.', '0');
INSERT INTO `exercise` VALUES ('67', '23', null, 'Show that RANDOMIZED-QUICKSORT\'s expected running time is $\\Omega(n \\lg n)$.', '$$\r\nE[X] = \\sum _{i = 1}^{n-1} \\sum _{k = 1}^{n-i} \\frac{2}{k-1} \\geq \\sum _{i = 1}^{n-1} \\sum _{k = 1}^{n-i} \\frac{2}{2k}\\\\\r\nE[X] = \\Omega(n\\lg n)\r\n$$', '0');
INSERT INTO `exercise` VALUES ('68', '23', null, 'We can improve the running time of quicksort in practice by taking advantage of the fast running time of insertion sort when its input is \"nearly\" sorted. Upon calling quicksort on a subarray with fewer than $k$ elements, let it simply return without sorting the subarray. After the top-level call to quicksort returns, run insertion sort on the entire array to finish the sorting process. Argue that this sorting algorithm runs in $O(n k+n \\lg (n / k))$ expected time. How should we pick $k$, both in theory and in practice?', 'For `IS`, the runtime is $O(k^2 \\cdot \\frac{n}{k}) = O(nk)$.\r\n\r\nFor `QS`, the expected runtime is $O(n \\cdot \\lg\\frac{n}{k})$.\r\n\r\nSo the runtime is $O(nk + n\\lg{\\frac{n}{k}})$.\r\n\r\nTheoretical:\r\n$$\r\nnk + n\\lg{\\frac{n}{k}} \\leq n\\lg n\\\\\r\n\\Rightarrow k - \\lg k \\leq 0\r\n$$\r\n\r\nPractical:\r\n\r\nWe can use a loop to test threshold within a range to find the most suitable range.', '0');
INSERT INTO `exercise` VALUES ('69', '23', null, 'Consider modifying the PARTITION procedure by randomly picking three elements from array $A$ and partitioning about their median (the middle value of the three elements). Approximate the probability of getting at worst an $\\alpha$-to- $(1-\\alpha)$ split, as a function of $\\alpha$ in the range $0<\\alpha<1$.', 'There are several cases and their probability.\r\n\r\n```\r\n3|0|0 a^3\r\n0|3|0 (1-2a)^3\r\n0|0|3 a^3\r\n2|1|0 3a^2(1-2a)\r\n2|0|1 3a^3\r\n1|2|0 3a(1-2a)^2\r\n0|2|1 3a(1-2a)^2\r\n0|1|2 3a^2(1-2a)\r\n1|0|2 3a^3\r\n1|1|1 6a^2(1-2a)\r\n```\r\n\r\n$$\r\nP = (1-2a)^3 + 6a(1-2a)^2 + 6a^2(1-2a)\\\\\r\n=(1 - 2a)(1 + 2a - 2a^2)\r\n= 1 - 6 a^2 + 4 a^3\r\n$$', '0');
INSERT INTO `exercise` VALUES ('70', '34', null, '![](images/20230374203526524.jpg)\r\n\r\nJava语言是什么时间问世的？它与Internet有什么关系？', '', '0');
INSERT INTO `exercise` VALUES ('71', '34', '1', 'Java语言有哪些特点？', '', '0');
INSERT INTO `exercise` VALUES ('72', '34', '1', 'Java语言取消了C++语言中的哪些内容？取消了这些内容后，给Java语言带来了什么好处？', '', '0');
INSERT INTO `exercise` VALUES ('73', '34', '1', 'Java语言的可移植性为什么比较高？', '', '0');
INSERT INTO `exercise` VALUES ('74', '34', null, 'Java语言程序分为哪两种？', '', '0');
INSERT INTO `exercise` VALUES ('75', '34', null, 'Java Application程序在结构上有哪些特点？', '', '0');
INSERT INTO `exercise` VALUES ('76', '34', null, 'Java程序在书写上应注意哪些事项？', '', '0');
INSERT INTO `exercise` VALUES ('77', '34', null, 'Java Application编译后生成什么文件？该文件机器可以直接识别吗？', '', '0');
INSERT INTO `exercise` VALUES ('78', '34', null, 'Java Application程序是如何被运行的？', '', '0');
INSERT INTO `exercise` VALUES ('79', '34', null, 'Java Application程序有哪两种输出界面？', '', '0');
INSERT INTO `exercise` VALUES ('80', '34', '1', '在下列概念中，Java语言只保留了______。\r\n<opt>A.运算符重载\r\n<opt>B.方法重载\r\n<opt>C.指针\r\n<opt>D.结构和联合', 'B', '1');
INSERT INTO `exercise` VALUES ('81', '34', '1', '下列关于Java语言特性的描述中，错误的是______。\r\n<opt>A.支持多线程操作\r\n<opt>B.Java程序与平台无关\r\n<opt>C.Java程序可以直接访问Internet上的对象\r\n<opt>D.支持单继承和多继承', 'D', '1');
INSERT INTO `exercise` VALUES ('82', '34', '1', '下列关于Java Application程序结构特点的描述中，错误的是______。\r\n<opt>A.Java程序是由一个或多个类组成的\r\n<opt>B.组成Java程序的若干个类可以放在一个文件中，也可以放在多个文件中\r\n<opt>C.Java程序的文件名要与某个类名相同\r\n<opt>D.组成Java程序的多个类中，有且仅有一个主类', 'C', '1');
INSERT INTO `exercise` VALUES ('83', '34', null, 'Java程序经过编译后生成的文件的后缀是______。\r\n<opt>A..obj\r\n<opt>B..exe\r\n<opt>C..class\r\n<opt>D..java', 'C', '1');
INSERT INTO `exercise` VALUES ('84', '34', null, '下列关于运行字节码文件的命令行参数的描述中，正确的是______。\r\n<opt>A.第一个命令行参数（紧跟命令字的参数）被存放在args[0]中\r\n<opt>B.第一个命令行参数被存放在args[1]中\r\n<opt>C.命令行的命令字被放在args[0]中\r\n<opt>D.数组args[]的大小与命令行参数的个数无关', 'A', '1');
INSERT INTO `exercise` VALUES ('85', '34', null, 'Java语言是在C++语言之前问世的。', '0', '2');
INSERT INTO `exercise` VALUES ('86', '34', null, 'Java语言具有较好的安全性和可移植性及与平台无关等特性。', '1', '2');
INSERT INTO `exercise` VALUES ('87', '34', null, 'Java语言中取消了联合概念，保留了结构概念。', '0', '2');
INSERT INTO `exercise` VALUES ('88', '34', null, 'Java语言中数据类型占内存字节数与平台无关。', '1', '2');
INSERT INTO `exercise` VALUES ('89', '34', null, 'Java语言中可用下标和指针两种方式表示数组元素。', '0', '2');
INSERT INTO `exercise` VALUES ('90', '34', null, 'Java语言的源程序不是编译型的，而是编译解释型的。', '1', '2');
INSERT INTO `exercise` VALUES ('91', '34', null, '操作系统中进程和线程两个概念是没有区别的。', '0', '2');
INSERT INTO `exercise` VALUES ('92', '34', null, 'Java语言既是面向对象的又是面向网络的高级语言。', '1', '2');
INSERT INTO `exercise` VALUES ('93', '34', null, 'Java程序分为两大类：一类是Application程序，另一类是Applet程库。前者又称Java应用程序，后者又称Java小应用程序。', '1', '2');
INSERT INTO `exercise` VALUES ('94', '34', null, 'Java Application程序是由多个文件组成的，其中可以有也可以没有主文件。', '0', '2');
INSERT INTO `exercise` VALUES ('95', '34', null, '组成JavaApplicntion 的着干类中，有且仅有一个主类，只有主类中合有生方法main（）。', '1', '2');
INSERT INTO `exercise` VALUES ('96', '34', null, 'Java Application程序中，必有一个主方法main（），该方法有没有参数都可以。', '0', '2');
INSERT INTO `exercise` VALUES ('97', '34', null, 'Java程序中是不区分大小写字母的。', '0', '2');
INSERT INTO `exercise` VALUES ('98', '34', null, '下述两个命令：javac和java是不同的，编译时用前者，运行时用后者。', '1', '2');
INSERT INTO `exercise` VALUES ('99', '34', null, 'Java程序编译后生成的是字节码文件，其后缀是.exe。', '0', '2');
INSERT INTO `exercise` VALUES ('100', '34', null, '字节码文件机器是不能直接识别的，它要经过解释器，边解释边执行。', '1', '2');
INSERT INTO `exercise` VALUES ('101', '34', null, '在Java程序中，使用import语句引入类是在解释器中实现的。', '1', '2');
INSERT INTO `exercise` VALUES ('102', '34', null, '在运行字节码文件时，使用java命令，一定要给出字节码文件的扩展名（class）。', '0', '2');
INSERT INTO `exercise` VALUES ('103', '34', null, '如果一个Java程序中有多个类，编译后只生成一个字节码文件，其名字同主类名。', '0', '2');
INSERT INTO `exercise` VALUES ('104', '34', null, 'Java程序中出现的输出方法println（）和print（）是完全一致的。', '0', '2');
INSERT INTO `exercise` VALUES ('105', '34', null, '分析下列程序的输出结果：\r\n```\r\npublic class Factorial {\r\n  public static void main(String[] args) {\r\n    int a = 6;\r\n    int b = factorialCal(a);\r\n    System.out.println(\"The factorial of \" + a + \" is: \" + b);\r\n  }\r\n\r\n  public static int factorialCal(int num) {\r\n    if (num > 1) {\r\n    return num * factorialCal(num - 1);\r\n    } else {\r\n    return 1;\r\n    }\r\n  }\r\n}\r\n```', '', '4');
INSERT INTO `exercise` VALUES ('106', '34', null, '编写一个Java Application程序，使该程序运行后输出字符串“Hello！How you.”。', '', '5');
INSERT INTO `exercise` VALUES ('107', '34', null, '编写一个Java Application程序，使该程序输出显示如下结果：\r\n```\r\nvar1=10，var2=15.9\r\nok！\r\n```', '', '5');
INSERT INTO `exercise` VALUES ('108', '35', null, 'Java的单词有哪些？Java语言使用的字符集与C++语言的相同吗？', '', '0');
INSERT INTO `exercise` VALUES ('109', '35', null, '标识符有何用途？标识符的规则是什么？', '', '0');
INSERT INTO `exercise` VALUES ('110', '35', null, '分隔符花括号通常用在什么地方？', '', '0');
INSERT INTO `exercise` VALUES ('111', '35', null, '文档注释符与多行注释符有何不同？', '', '0');
INSERT INTO `exercise` VALUES ('112', '35', null, 'Java语言的基本数据类型包含哪几种？', '', '0');
INSERT INTO `exercise` VALUES ('113', '36', null, '字节型和字符型数据有何区别？', '', '0');
INSERT INTO `exercise` VALUES ('114', '36', null, 'Java语言中基本数据类型的长度是随计算机的不同而不同吗？', '', '0');
INSERT INTO `exercise` VALUES ('115', '36', null, '长度为32位的基本数据类型有哪些？', '', '0');
INSERT INTO `exercise` VALUES ('116', '36', null, 'Java语言中，复合数据类型有哪些？', '', '0');
INSERT INTO `exercise` VALUES ('117', '36', null, 'Java语言中，数据类型转换有哪两种？当数据从低类型转换为高类型时需要用强制转换吗？', '', '0');
INSERT INTO `exercise` VALUES ('118', '37', null, 'Java语言中，常量的种类有哪些？', '', '0');
INSERT INTO `exercise` VALUES ('119', '37', null, '整型常量有哪3种表示形式？浮点型变量有哪两种表示形式？', '', '0');
INSERT INTO `exercise` VALUES ('120', '37', null, '布尔型常量可以转换成其他数据类型吗？例如整型。', '', '0');
INSERT INTO `exercise` VALUES ('121', '37', null, '在Java语言的转义字符表示中，ASCII码值对应的字符如何表示？Unicode字符集中对应的字符如何表示？', '', '0');
INSERT INTO `exercise` VALUES ('122', '37', null, '在Java语言中，表示字符串常量时应注意哪些问题？', '', '0');
INSERT INTO `exercise` VALUES ('123', '37', null, '在Java语言中，表示字符常量时应该注意什么问题？', '', '0');
INSERT INTO `exercise` VALUES ('124', '37', null, '字符串变量的含义是什么？', '', '0');
INSERT INTO `exercise` VALUES ('125', '37', null, 'Java语言中，变量的值除了有初值、默认值和改变值外，还有无意义值吗？', '', '0');
INSERT INTO `exercise` VALUES ('126', '37', null, 'Java语言中，定义变量至少要指出哪些要素？', '', '0');
INSERT INTO `exercise` VALUES ('127', '37', null, '变量的作用域规则是怎样规定的？', '', '0');
INSERT INTO `exercise` VALUES ('128', '37', null, 'Java语言中的变量有哪两种？', '', '0');
INSERT INTO `exercise` VALUES ('129', '37', null, 'Java语言是否允许在嵌套的程序块中定义同名变量？', '', '0');
INSERT INTO `exercise` VALUES ('130', '38', null, 'Java语言的运算符中按其操作数来划分，可分为哪些种类？举例说明。', '', '0');
INSERT INTO `exercise` VALUES ('131', '38', null, 'Java语言的运算符按其功能通常分为哪些种类？', '', '0');
INSERT INTO `exercise` VALUES ('132', '38', null, 'Java语言的运算符中按其优先级可划分几类？', '', '0');
INSERT INTO `exercise` VALUES ('133', '38', null, 'Java语言的运算符中按其结合性可划分为哪些类？', '', '0');
INSERT INTO `exercise` VALUES ('134', '38', null, 'Java语言中，逻辑运算符有哪些？运算符&作为双目运算符，如何区分它是逻辑与还是按位与？', '', '0');
INSERT INTO `exercise` VALUES ('135', '38', null, '移位运算符中，两种右移运算符>和>有何不同？', '', '0');
INSERT INTO `exercise` VALUES ('136', '38', null, '对象运算符instance of如何使用？', '', '0');
INSERT INTO `exercise` VALUES ('137', '38', null, '内存分配运算符是什么？功能如何？', '', '0');
INSERT INTO `exercise` VALUES ('138', '38', null, '类的成员使用什么运算符表示？', '', '0');
INSERT INTO `exercise` VALUES ('139', '38', null, '有哪几种运算符组成的表达式的值是算术值？', '', '0');
INSERT INTO `exercise` VALUES ('140', '38', null, '有哪几种运算符组成的表达式的值是布尔值？', '', '0');
INSERT INTO `exercise` VALUES ('141', '38', null, '简洁逻辑运算符与非简洁逻辑运算符组成的表达式，在求值上有何不同？', '', '0');
INSERT INTO `exercise` VALUES ('142', '40', null, '什么是表达式语句？什么是空语句？', '', '0');
INSERT INTO `exercise` VALUES ('143', '40', null, '什么是块语句？可以把块语句视为一条语句吗？', '', '0');
INSERT INTO `exercise` VALUES ('144', '40', null, 'Java语言中，选择语句有哪两种形式？', '', '0');
INSERT INTO `exercise` VALUES ('145', '40', null, 'switch语句中，<语句序列>里一定要有break语句吗？', '', '0');
INSERT INTO `exercise` VALUES ('146', '40', null, 'while循环语句与do-while循环语句有何不同？', '', '0');
INSERT INTO `exercise` VALUES ('147', '40', null, 'for循环语句中，关键字for后面括号内的表达式是否可以使用多个用逗号分隔的表达式？', '', '0');
INSERT INTO `exercise` VALUES ('148', '40', null, 'break语句和continue语句各有哪两种形式？', '', '0');
INSERT INTO `exercise` VALUES ('149', '40', null, 'import语句和package语句的功能分别是什么？', '', '0');
INSERT INTO `exercise` VALUES ('150', '39', null, '在Java语言中，如何定义一个数组？', '', '0');
INSERT INTO `exercise` VALUES ('151', '39', null, 'Java中定义的数组都可以进行初始化吗？', '', '0');
INSERT INTO `exercise` VALUES ('152', '39', null, 'Java中数组在静态和动态赋值时都判越界吗？', '', '0');
INSERT INTO `exercise` VALUES ('153', '39', null, '数组元素为基本数据类型的数组，在创建时系统都给指定默认值吗？布尔型的默认值是什么？', '', '0');
INSERT INTO `exercise` VALUES ('154', '39', null, 'Java中的数组实际上是一个隐含的“数组类”的对象，而数组名实际上是该对象的一个引用。这种说法对吗？', '', '0');
INSERT INTO `exercise` VALUES ('155', '39', null, '字符数组和字符串是两回事，而字符串实际上是String类和StringBuffer类的对象。这种说法对吗？', '', '0');
INSERT INTO `exercise` VALUES ('156', '39', null, '字符串有两种，分别是哪两种？它们之间有何不同？', '', '0');
INSERT INTO `exercise` VALUES ('157', '35', null, 'Java语言所用的字符集中字符是______位。\r\n<opt>A.8\r\n<opt>B.16\r\n<opt>C.32\r\n<opt>D.64', '', '1');
INSERT INTO `exercise` VALUES ('158', '35', null, '下列关于标识符的描述中，正确的是______。\r\n<opt>A.标识符中可以使用下画线和美元符\r\n<opt>B.标识符中可以使用连接符和井号符\r\n<opt>C.标识符中大小写字母是无区别的\r\n<opt>D.标识符可选用关键字', '', '1');
INSERT INTO `exercise` VALUES ('159', '35', null, 'Java语言的各种分隔符中，非法的是______。\r\n<opt>A.空白符\r\n<opt>B.分号\r\n<opt>C.逗号\r\n<opt>D.问号', '', '1');
INSERT INTO `exercise` VALUES ('161', '36', null, '下列描述的两种数据类型的长度不相等的是______。\r\n<opt>A.字符型和布尔型\r\n<opt>B.字节型和布尔型\r\n<opt>C.短整型和字符型\r\n<opt>D.整型和单精度浮点型', '', '1');
INSERT INTO `exercise` VALUES ('162', '36', null, '下面是关于Java语言中数据类型的强制转换的描述，其中错误的是______。\r\n<opt>A.当数据类型从高转换为低时需要强制转换\r\n<opt>B.强制转换时使用强制转换运算符，形如（（类型））\r\n<opt>C.浮点型数据强制转换为整型时，小数部分四舍五入\r\n<opt>D.赋值操作中都要采用强制类型', '', '1');
INSERT INTO `exercise` VALUES ('163', '37', null, '下列关于常量的描述中，错误的是______。\r\n<opt>A.Java语言的常量有5种\r\n<opt>B.浮点型数12.456是单精度的\r\n<opt>C.布尔型常量只有两个可选值：true和false\r\n<opt>D.字符串常量含有结束符’\\0’！', '', '1');
INSERT INTO `exercise` VALUES ('164', '37', null, '下列关于定义符号常量的描述中，错误的是______。\r\n<opt>A.定义符号常量使用关键字const\r\n<opt>B.定义符号常量时要赋初值\r\n<opt>C.符号常量既可定义为类成员，又可在方法中定义\r\n<opt>D.定义符号常量时必须给出数据类型', 'A', '1');
INSERT INTO `exercise` VALUES ('165', '37', null, '下列关于变量的默认值的描述，其中错误的是______。\r\n<opt>A.定义变量而没有进行初始化时，该变量具有默认值\r\n<opt>B.字符型变量的默认值为换行符\r\n<opt>C.布尔型变量的默认值为true\r\n<opt>D.变量的默认值是可以被改变的', 'C', '1');
INSERT INTO `exercise` VALUES ('166', '37', null, '下列关于变量定义的描述中，正确的是______。\r\n<opt>A.定义变量时至少应指出变量名字和类型\r\n<opt>B.定义变量时没有给出初值，该变量可能是无意义值\r\n<opt>C.定义变量时，同一个类型多个变量间可用逗号分隔\r\n<opt>D.定义变量时必须要给变量初始化', '', '1');
INSERT INTO `exercise` VALUES ('167', '37', null, '下列关于变量作用域的描述，错误的是______。\r\n<opt>A.在某个作用域定义的变量，仅在该作用域内是可见的，而在该作用域外是不可见的\r\n<opt>B.在类中定义的变量的作用域在类体内，该类中的方法内可以使用\r\n<opt>C.在方法中定义的变量的作用域仅在该方法体内\r\n<opt>D.在方法中作用域可嵌套，在嵌套的作用域中可以定义同名变量', '', '1');
INSERT INTO `exercise` VALUES ('168', '38', null, '下列关于增1（++）减1（--）运算符的描述中，正确的是______。\r\n<opt>A.增1减1运算符都是单目运算符\r\n<opt>B.增1减1运算符都具有前缀运算和后缀运算\r\n<opt>C.增1减1运算符不会改变变量的值\r\n<opt>D.增1减1运算符前缀运算和后缀运算后表达式值是相同的', '', '1');
INSERT INTO `exercise` VALUES ('169', '38', null, '下列关于运算符优先级的描述中，错误的是______。\r\n<opt>A.在表达式中，优先级高的运算符先进行计算\r\n<opt>B.赋值运算符优先级最低\r\n<opt>C.单目运算符优先级高于双目和三目运算符\r\n<opt>D.逻辑运算符优先级高于逻辑位运算符', '', '1');
INSERT INTO `exercise` VALUES ('170', '38', null, '下列关于表达式的描述中，正确的是______。\r\n<opt>A.任何表达式都有确定的值和类型\r\n<opt>B.算术表达式的类型由第一个操作数的类型决定\r\n<opt>C.逻辑表达式的操作数是逻辑型的\r\n<opt>D.赋值表达式的类型取决于右值表达式的类型', '', '1');
INSERT INTO `exercise` VALUES ('171', '40', null, '下列关于条件语句的描述中，错误的是______。\r\n<opt>A.if语句可以有多个else子句和else if子句\r\n<opt>B.if语句中可以没有else子句和else if子句\r\n<opt>C.if语句的if体、else体内可以有循环语句\r\n<opt>D.if语句中的条件可以使用任何表达式', '', '1');
INSERT INTO `exercise` VALUES ('172', '40', null, '下列关于开关语句的描述中，错误的是______。\r\n<opt>A.开关语句中，default子句可以省略\r\n<opt>B.开关语句中，case子句的（语句序列）中一定含有break语句\r\n<opt>C.开关语句中，case子句和default子句都可以有多个\r\n<opt>D.退出开关语句的唯一条件是执行break语句', '', '1');
INSERT INTO `exercise` VALUES ('173', '40', null, '下列关于循环语句的描述中，错误的是______。\r\n<opt>A.任何一种循环体内都可以包含一种循环语句\r\n<opt>B.循环体可以是空语句，也可以是空\r\n<opt>C.循环体内可以出现多个break语句\r\n<opt>D.循环语句中，循环体至少被执行一次', '', '1');
INSERT INTO `exercise` VALUES ('174', '40', null, '下列循环语句的循环次数是______。\r\n```\r\nint i=5;\r\ndo {\r\n    System.out.println(i--);\r\n    i--;\r\n}while(i != 0);\r\n```\r\n<opt>A.0\r\n<opt>B.1\r\n<opt>C.5\r\n<opt>D.无穷', '', '1');
INSERT INTO `exercise` VALUES ('175', '39', null, '下列关于Java语言的数组描述中，错误的是______。\r\n<opt>A.数组的长度通常用length表示\r\n<opt>B.数组下标从0开始\r\n<opt>C.数组元素是按顺序存放在内存的\r\n<opt>D.数组在赋初值和赋值时都不判越界', '', '1');
INSERT INTO `exercise` VALUES ('176', '39', null, '下列关于字符串的描述中，错误的是______。\r\n<opt>A.Java语言中，字符串分为字符串常量和字符串变量两种\r\n<opt>B.两种不同的字符串都是String类的对象\r\n<opt>C.Java语言中不再使用字符数组存放字符串\r\n<opt>D.Java Application程序的main（）的参数args[]是一个String类的对象数组，用它可存放若干个命令行参数', '', '1');
INSERT INTO `exercise` VALUES ('177', '35', null, 'Java语言标识符中可以使用美元符。', '', '2');
INSERT INTO `exercise` VALUES ('178', '35', null, 'Java语言标识符中大小写字母是没有区别的。', '', '2');
INSERT INTO `exercise` VALUES ('179', '35', null, '分号（;）、逗号（，）和冒号（：）都可作为Java语言中的分隔符。', '', '2');
INSERT INTO `exercise` VALUES ('180', '36', null, 'Java 语言的基本数据类型有4种：整型、浮点型、字符型和布尔型。', '', '2');
INSERT INTO `exercise` VALUES ('181', '36', null, 'Java 语言的复合数据类型有3种：数组、类和包。', '', '2');
INSERT INTO `exercise` VALUES ('182', '36', null, 'Java语言中，字节型与字符型是一样的。', '', '2');
INSERT INTO `exercise` VALUES ('183', '36', null, 'Java语言是一种强类型语言，数据类型转换有两种：隐含转换和强制转换。', '', '2');
INSERT INTO `exercise` VALUES ('184', '36', null, '数据由高类型转换到低类型时，采用强制转换，数据精度要受到损失。', '', '2');
INSERT INTO `exercise` VALUES ('185', '36', null, '布尔型常量可以自动转换为短整型常量。', '', '2');
INSERT INTO `exercise` VALUES ('186', '36', null, 'Java语言使用的是Unicode字符集，每个字符在内存中占8位。', '', '2');
INSERT INTO `exercise` VALUES ('187', '36', null, 'Java语言的字符串中不隐含结束符。', '', '2');
INSERT INTO `exercise` VALUES ('188', '37', null, ' Java语言中定义符号常量使用final关键字。', '', '2');
INSERT INTO `exercise` VALUES ('189', '36', null, 'Java语言中不同数据类型的长度是固定的，不随机器硬件不同而改变。', '', '2');
INSERT INTO `exercise` VALUES ('190', '36', null, 'Java语言中只有无符号的字符型。', '', '2');
INSERT INTO `exercise` VALUES ('191', '36', null, '字符型变量中只存放一个字符。', '', '2');
INSERT INTO `exercise` VALUES ('192', '37', null, '定义变量时必须进行初始化，否则变量具有无意义的值。', '0', '2');
INSERT INTO `exercise` VALUES ('193', '37', null, '若定义变量时不进行初始化，则该变量一定具有默认值。', '', '2');
INSERT INTO `exercise` VALUES ('194', '37', null, 'Java语言中，变量出现的位置只有一种，即为类体内定义的成员变量。', '', '2');
INSERT INTO `exercise` VALUES ('195', '37', null, 'Java语言规定在嵌套的程序块中不允许定义同名变量。', '', '2');
INSERT INTO `exercise` VALUES ('196', '38', null, '求余运算符%可用于整数和浮点数。', '', '2');
INSERT INTO `exercise` VALUES ('197', '38', null, '关系运算符组成的表达式是逻辑型表达式。', '', '2');
INSERT INTO `exercise` VALUES ('198', '38', null, '逻辑运算符&和&&是没有区别的，都具有逻辑与的功能。', '', '2');
INSERT INTO `exercise` VALUES ('199', '38', null, '运算符&是逻辑与运算符还是按位与运算符取决于操作数的类型。', '', '2');
INSERT INTO `exercise` VALUES ('200', '38', null, '运算符>>和>>都是右移位运算符，其区别在于对向右移出的位是舍弃还是保留。', '', '2');
INSERT INTO `exercise` VALUES ('201', '38', null, '赋值运算符组成的赋值表达式中，通常将右边表达式的类型转换为左边变量 的类型后再赋值。', '', '2');
INSERT INTO `exercise` VALUES ('202', '38', null, '三目运算符的3个操作数中，第一个操作数的类型必须是逻辑型的。', '', '2');
INSERT INTO `exercise` VALUES ('203', '38', null, '强制类型转换运算符的功能是将一个表达式的类型转换为所指定的类型。', '', '2');
INSERT INTO `exercise` VALUES ('204', '38', null, '对象运算符instance of是一个单目运算符，其表达式的值是类的对象。', '', '2');
INSERT INTO `exercise` VALUES ('205', '38', null, '内存分配运算符new可以为创建的数组分配内存空间，但不能为创建的变量分配空间。', '', '2');
INSERT INTO `exercise` VALUES ('206', '38', null, '运算符的优先级中，最低的是三目运算符。', '', '2');
INSERT INTO `exercise` VALUES ('207', '38', null, '运算符的结合性中，除了三目运算符是自右向左外，其余都是自左向右。', '', '2');
INSERT INTO `exercise` VALUES ('208', '38', null, '关系表达式和逻辑表达式的值都是布尔型的。', '', '2');
INSERT INTO `exercise` VALUES ('209', '38', null, '赋值表达式的值不能是逻辑型的。', '', '2');
INSERT INTO `exercise` VALUES ('210', '38', null, '条件表达式的类型总是“？”和“：”之间的操作数的类型。', '', '2');
INSERT INTO `exercise` VALUES ('211', '40', null, '块语句可以嵌套，外层块语句定义的变量在内层块语句中是可见的。', '', '2');
INSERT INTO `exercise` VALUES ('212', '40', null, '条件语句中的<条件>表达式可以是任何表达式。', '', '2');
INSERT INTO `exercise` VALUES ('213', '40', null, '在条件语句的嵌套结构中，一个if子句最多有一个else子句与它配对，而且一定是距离它最近的。', '', '2');
INSERT INTO `exercise` VALUES ('214', '40', null, '开关语句中，case子句后面的（语句序列）可以是块语句。', '', '2');
INSERT INTO `exercise` VALUES ('215', '40', null, '循环语句中，条件表达式必须是逻辑型表达式。', '', '2');
INSERT INTO `exercise` VALUES ('216', '40', null, '在Java语言中，break语句不能作用在（标号名）的左边。', '', '2');
INSERT INTO `exercise` VALUES ('217', '39', null, 'Java语言中，数组在静态和动态赋值时都判越界。', '', '2');
INSERT INTO `exercise` VALUES ('218', '39', null, '说明或声明数组时不分配内存大小，创建数组时分配内存大小。', '', '2');
INSERT INTO `exercise` VALUES ('219', '39', null, '基本数据类型的数组在创建时系统将指定默认值。', '', '2');
INSERT INTO `exercise` VALUES ('220', '39', null, '数组在定义时可以进行初始化，使用初始值表。', '', '2');
INSERT INTO `exercise` VALUES ('221', '39', null, 'Java语言中数组元素只有下标表示，没有指针表示。', '', '2');
INSERT INTO `exercise` VALUES ('222', '39', null, '创建数组时，系统自动将数组元素个数存放在length变量中，可供用户对数组操作时使用。', '', '2');
INSERT INTO `exercise` VALUES ('223', '39', null, '字符串可分为字符串常量和字符串变量两种，它们都是对象。', '', '2');
INSERT INTO `exercise` VALUES ('224', '39', null, 'Java语言中不使用字符数组存放字符串。', '', '2');
INSERT INTO `exercise` VALUES ('225', '38', null, '已知：int a=3，b=5；\r\n求下列表达式的值：\r\n1. (a+b)%b\r\n2. b>>a\r\n3. -b>>>a\r\n4. a&b\r\n5. ++a-b++', '', '4');
INSERT INTO `exercise` VALUES ('226', '41', null, '什么是对象？什么是类？二者有何关系？', '', '0');
INSERT INTO `exercise` VALUES ('227', '41', null, '对象的三大要素是什么？', '', '0');
INSERT INTO `exercise` VALUES ('228', '41', null, '类的封装性、继承性和多态性各自的内容是什么？', '', '0');
INSERT INTO `exercise` VALUES ('229', '42', null, '类的定义格式是什么？Java语言和C++语言中定义类的格式是否相同？', '', '0');
INSERT INTO `exercise` VALUES ('230', '42', null, '定义类的修饰符有哪些？各自的特点是什么？', '', '0');
INSERT INTO `exercise` VALUES ('231', '42', null, 'Java语言中，成员变量的定义格式如何？它有哪些修饰符？', '', '0');
INSERT INTO `exercise` VALUES ('232', '42', null, 'Java语言中，方法的定义格式如何？方法的修饰符有哪些？', '', '0');
INSERT INTO `exercise` VALUES ('233', '42', null, '方法调用中应注意什么事项？', '', '0');
INSERT INTO `exercise` VALUES ('234', '42', null, '如何定义重载方法？如何选择重载方法？', '', '0');
INSERT INTO `exercise` VALUES ('235', '42', null, '构造方法的特点是什么？作用是什么？', '', '0');
INSERT INTO `exercise` VALUES ('236', '42', null, '析构方法的特点是什么？作用是什么？', '', '0');
INSERT INTO `exercise` VALUES ('237', '42', null, '什么是静态变量？什么是静态方法？各自有何特点？', '', '0');
INSERT INTO `exercise` VALUES ('238', '42', null, '静态初始化器有何功能？如何定义？', '', '0');
INSERT INTO `exercise` VALUES ('239', '42', null, '什么是抽象类？什么是抽象方法？各自有什么特点？', '', '0');
INSERT INTO `exercise` VALUES ('240', '42', null, '什么是最终类？什么是最终变量？什么是最终方法？', '', '0');
INSERT INTO `exercise` VALUES ('241', '43', null, '对象的定义格式如何？如何给对象初始化？如何给对象赋值？', '', '0');
INSERT INTO `exercise` VALUES ('242', '43', null, '对象通常有哪些应用？', '', '0');
INSERT INTO `exercise` VALUES ('243', '44', null, 'Java语言的继承性有何特点？', '', '0');
INSERT INTO `exercise` VALUES ('244', '44', null, '如何创建一个类的子类？', '', '0');
INSERT INTO `exercise` VALUES ('245', '44', null, '什么是继承的传递性？', '', '0');
INSERT INTO `exercise` VALUES ('246', '44', null, '子类的构造方法中应包含哪些内容？', '', '0');
INSERT INTO `exercise` VALUES ('247', '44', null, '子类和父类对象之间转换的规则是什么？', '', '0');
INSERT INTO `exercise` VALUES ('248', '44', null, '什么是成员变量的继承？什么是成员变量的覆盖？', '', '0');
INSERT INTO `exercise` VALUES ('249', '44', null, '什么是成员方法的重载？什么是成员方法的覆盖？', '', '0');
INSERT INTO `exercise` VALUES ('250', '45', null, '什么是接口？如何定义接口？接口与类有何区别？', '', '0');
INSERT INTO `exercise` VALUES ('251', '45', null, '如何在类中实现接口？', '', '0');
INSERT INTO `exercise` VALUES ('252', '45', null, '什么是包？如何创建包？如何引用包？', '', '0');
INSERT INTO `exercise` VALUES ('253', '45', null, 'Java语言提供的工具类中包含了哪些常用的包？', '', '0');
INSERT INTO `exercise` VALUES ('254', '45', null, 'Object类、Math类和System类的功能各是什么？有哪些主要方法？', '', '0');
INSERT INTO `exercise` VALUES ('255', '45', null, '字符串类String和String Buffer有何不同？', '', '0');
INSERT INTO `exercise` VALUES ('256', '41', null, '下列对封装性的描述中，错误的是______。\r\n<opt>A.封装体包含了属性和行为\r\n<opt>B.封装体中的属性和行为的访问权限是相同的\r\n<opt>C.被封装的某些信息在封装体外是不可见的\r\n<opt>D.封装使得抽象的数据类型提高了可重用性', '', '1');
INSERT INTO `exercise` VALUES ('257', '41', null, '下列关于继承性的描述中，错误的是______。\r\n<opt>A.一个类可以同时生成多个子类\r\n<opt>B.Java语言支持单重继承和多重继承\r\n<opt>C.子类继承了父类的所有成员\r\n<opt>D.封装使得抽象的数据类型提高了可重用性', '', '1');
INSERT INTO `exercise` VALUES ('258', '41', null, '下列对多态性的描述中，错误的是______。\r\n<opt>A.Java语言允许运算符重载\r\n<opt>B.Java语言允许方法重载\r\n<opt>C.Java语言允许变量覆盖\r\n<opt>D.多态性提高了程序的抽象性和简洁性', '', '1');
INSERT INTO `exercise` VALUES ('259', '42', null, '在类的修饰符中，规定只能被同一包类所使用的修饰符是______。\r\n<opt>A.public\r\n<opt>B.默认\r\n<opt>C.final\r\n<opt>D.abstract', '', '1');
INSERT INTO `exercise` VALUES ('260', '42', null, '在成员变量的修饰符中，规定只允许该类自身访问的修饰符是______。\r\n<opt>A.public\r\n<opt>B.默认\r\n<opt>C.private\r\n<opt>D.protected', '', '1');
INSERT INTO `exercise` VALUES ('261', '42', null, '在成员方法的访问控制修饰符中，规定访问权限包含该类自身、同包的其他类和其他包的该类子类的修饰符是______。\r\n<opt>A.public\r\n<opt>B.默认\r\n<opt>C.private\r\n<opt>D.protected', '', '1');
INSERT INTO `exercise` VALUES ('262', '42', null, '下列关于构造方法的特点的描述中，错误的是______。\r\n<opt>A.不可重载\r\n<opt>B.方法名同类名\r\n<opt>C.无返回类型\r\n<opt>D.系统自动调用', '', '1');
INSERT INTO `exercise` VALUES ('263', '42', null, '下列关于静态方法的描述中，错误的是______。\r\n<opt>A.在类体内说明静态方法使用关键字static\r\n<opt>B.静态方法只能处理静态变量或调用静态方法\r\n<opt>C.静态方法不占用对象的内存空间，非静态方法占用对象的内存空间\r\n<opt>D.静态方法只能用类名调用', '', '1');
INSERT INTO `exercise` VALUES ('264', '42', null, '下列对静态初始化器的描述中，错误的是______。\r\n<opt>A.静态初始化器是用来对类进行初始化的，而不是对某个对象初始化\r\n<opt>B.静态初始化器是由关键字static和一对花括号组成的语句组\r\n<opt>C.静态初始化器不同于构造方法，它不是方法\r\n<opt>D.静态初始化器是产生新对象时，由系统自动调用的', '', '1');
INSERT INTO `exercise` VALUES ('265', '44', null, '下列关于抽象类的描述中，错误的是______。\r\n<opt>A.抽象类是用修饰符abstract说明的\r\n<opt>B.抽象类是不可以定义对象的\r\n<opt>C.抽象类是不可以有构造方法的\r\n<opt>D.抽象类通常要有它的子类', '', '1');
INSERT INTO `exercise` VALUES ('266', '44', null, '下列关于类的继承性的描述中，错误的是______。\r\n<opt>A.继承是在已有类的基础上生成新类的一种方法\r\n<opt>B.子类继承父类的所有成员\r\n<opt>C.Java语言要求一个子类只有一个父类\r\n<opt>D.父类中成员的访问权限在子类中将被改变', '', '1');
INSERT INTO `exercise` VALUES ('267', '44', null, '下列关于子类继承父类的成员的描述中，错误的是______。\r\n<opt>A.子类中继承父类中的所有成员都可以直接访问\r\n<opt>B.子类中定义有与父类同名变量时，子类继承父类的操作中，使用继承父类的变量；子类执行自己的操作中，使用自己定义的变量\r\n<opt>C.当子类中出现成员方法头与父类方法头相同的方法时，子类成员方法覆盖父类中的成员方法\r\n<opt>D.方法重载是编译时处理的，而方法覆盖是在运行时处理的', '', '1');
INSERT INTO `exercise` VALUES ('268', '45', null, '下列关于接口的描述中，错误的是______。\r\n<opt>A.接口实际上是由常量和抽象方法构成的特殊类\r\n<opt>B.一个类只允许继承一个接口\r\n<opt>C.定义接口使用的关键字是interface\r\n<opt>D.在继承接口的类中通常要给出接口中定义的抽象方法的具体实现', '', '1');
INSERT INTO `exercise` VALUES ('269', '45', null, '下列关于包的描述中，错误的是______。\r\n<opt>A.包是一种特殊的类\r\n<opt>B.包是使用package语句创建的\r\n<opt>C.包有有名包和无名包两种\r\n<opt>D.包是若干个类的集合', '', '1');
INSERT INTO `exercise` VALUES ('270', '45', null, '下列常用包中，存放用户图形界面类库的包是______。\r\n<opt>A.awt\r\n<opt>B.lang\r\n<opt>C.util\r\n<opt>D.io', '', '1');
INSERT INTO `exercise` VALUES ('271', '45', null, '下列是系统提供的常用的类，是所有类的父类的类是______。\r\n<opt>A.Math\r\n<opt>B.Object\r\n<opt>C.System\r\n<opt>D.String', '', '1');
INSERT INTO `exercise` VALUES ('272', '41', null, '类是一种类型，也是对象的模板。', '', '2');
INSERT INTO `exercise` VALUES ('273', '41', null, 'Java语言只支持单重继承，不支持多重继承。', '', '2');
INSERT INTO `exercise` VALUES ('274', '42', null, '类中说明的方法可以定义在类体外。', '', '2');
INSERT INTO `exercise` VALUES ('275', '42', null, 'class不是定义类的唯一关键字。', '', '2');
INSERT INTO `exercise` VALUES ('276', '43', null, '某类的对象可以作为另个类的成员。', '', '2');
INSERT INTO `exercise` VALUES ('277', '43', null, '在类体内说明成员变量时不允许赋初值。', '', '2');
INSERT INTO `exercise` VALUES ('278', '43', null, '最终变量就是Java语言中的符号常量。', '', '2');
INSERT INTO `exercise` VALUES ('279', '43', null, '静态变量的引用只能使用对象。', '', '2');
INSERT INTO `exercise` VALUES ('280', '43', null, '静态方法只能处理静态变量。', '', '2');
INSERT INTO `exercise` VALUES ('281', '44', null, '抽象方法是一种只有说明而无具体实现的方法。', '', '2');
INSERT INTO `exercise` VALUES ('282', '44', null, '最终方法是不能被当前子类重新定义的方法。', '', '2');
INSERT INTO `exercise` VALUES ('283', '42', null, 'Java语言中，方法调用一律都是传址的引用调用。', '', '2');
INSERT INTO `exercise` VALUES ('284', '42', null, '非静态方法中不能引用静态变量。', '', '2');
INSERT INTO `exercise` VALUES ('285', '42', null, '静态初始化器是在构造方法被自动调用之前运行的。', '', '2');
INSERT INTO `exercise` VALUES ('286', '44', null, '抽象方法仅有方法头，而无方法体。', '', '2');
INSERT INTO `exercise` VALUES ('287', '44', null, '抽象方法一定出现在抽象类中。', '', '2');
INSERT INTO `exercise` VALUES ('288', '44', null, '最终类、最终方法和最终变量的修饰符都用final。', '', '2');
INSERT INTO `exercise` VALUES ('289', '43', null, '创建对象时系统将调用适当的构造方法给对象初始化。', '', '2');
INSERT INTO `exercise` VALUES ('290', '43', null, '使用运算符new创建对象时，赋给对象的值实际上是一个地址值。', '', '2');
INSERT INTO `exercise` VALUES ('291', '43', null, '使用构造方法只能给非静态成员变量赋初值。', '', '2');
INSERT INTO `exercise` VALUES ('292', '43', null, '创建对象时，该对象占有的内存空间除了非静态的成员变量外，还有非静态的成员方法。', '', '2');
INSERT INTO `exercise` VALUES ('293', '43', null, 'Java语言中，对象赋值实际上同一个对象具有两个不同的名字，因为它们都有同一个地址值。', '', '2');
INSERT INTO `exercise` VALUES ('294', '43', null, '对象可作方法参数，对象数组不能作方法参数。', '', '2');
INSERT INTO `exercise` VALUES ('295', '44', null, 'Java语言中，所创建的子类都应有一个父类。', '', '2');
INSERT INTO `exercise` VALUES ('296', '44', null, 'Java语言中，类的继承是可以传递的。', '', '2');
INSERT INTO `exercise` VALUES ('297', '44', null, 'Java语言中，构造方法是可以继承的。', '', '2');
INSERT INTO `exercise` VALUES ('298', '44', null, '子类中构造方法应包含自身类的构造方法和直接父类的构造方法。', '', '2');
INSERT INTO `exercise` VALUES ('299', '44', null, '子类对象可以直接赋值给父类对象；而父类对象不可以赋值给子类对象。', '', '2');
INSERT INTO `exercise` VALUES ('300', '44', null, '调用this或super 的构造方法的语句必须放在第一条语句。', '', '2');
INSERT INTO `exercise` VALUES ('301', '44', null, '子类中所继承父类的成员都可以在子类中访问。', '', '2');
INSERT INTO `exercise` VALUES ('302', '44', null, '成员方法的重载和覆盖是一回事。', '', '2');
INSERT INTO `exercise` VALUES ('303', '45', null, '一个类可以实现多个接口。接口可以实现“多重继承”。', '', '2');
INSERT INTO `exercise` VALUES ('304', '45', null, '实现接口的类不能是抽象类。', '', '2');
INSERT INTO `exercise` VALUES ('305', '41', null, '对象具有3大要素，它们分别是______、______、______。这3大要素分别用______、______、______表示。', '', '3');
INSERT INTO `exercise` VALUES ('306', '42', null, '定义类时，通常要使用的关键字有______、______、______。', '', '3');
INSERT INTO `exercise` VALUES ('307', '42', null, '成员变量的定义格式如下：______<变量类型><变量名>=______;', '', '3');
INSERT INTO `exercise` VALUES ('308', '42', null, '成员变量的非访问控制修饰符有______、______、______。', '', '3');
INSERT INTO `exercise` VALUES ('309', '42', null, '在成员方法的定义中可省略的部分有______、______、______。', '', '3');
INSERT INTO `exercise` VALUES ('310', '42', null, 'Java语言中，重载方法的选择是在______时进行的，系统根据______、______、_____寻找匹配方法。', '', '3');
INSERT INTO `exercise` VALUES ('311', '42', null, '没有子类的类称为______，不能被子类重载的方法称为______，不能被改变值的量称为常量，又称为______。', '', '3');
INSERT INTO `exercise` VALUES ('312', '43', null, '创建一个对象时，通常要包含3项内容：______，给对象分配空间，______。', '', '3');
INSERT INTO `exercise` VALUES ('313', '43', null, '系统规定int型变量默认值为，浮点型变量的默认值为，布尔型变量的默认值为______。', '', '3');
INSERT INTO `exercise` VALUES ('314', '44', null, 'Java语言中，定义子类时，使用关键字______来给出父类名。如果没有指出父类，则该类的默认父类为______。', '', '3');
INSERT INTO `exercise` VALUES ('315', '44', null, '系统规定：表示当前类的构造方法用______，表示直接父类的构造方法用______。', '', '3');
INSERT INTO `exercise` VALUES ('316', '45', null, '接口中默认的成员变量的修饰符为______，默认的成员方法的修饰符是______。', '', '3');
INSERT INTO `exercise` VALUES ('317', '45', null, '实现接口中的抽象方法时，必须使用______方法头，并且还要用______修饰符。', '', '3');
INSERT INTO `exercise` VALUES ('318', '45', null, '包名与子包名之间用______分隔。加载包的关键字是______。', '', '3');
INSERT INTO `exercise` VALUES ('319', '45', null, '字符串类又包含两大类，它们是______和______。', '', '3');
INSERT INTO `exercise` VALUES ('320', '44', null, '分析下列程序的输出结果：\r\n```\r\npublic class Man extends Human {\r\n  public void eat() {\r\n	System.out.println(\"I can eat more\");\r\n  }\r\n  public static void main(String[] a) {\r\n	Man obj1 = new Man();\r\n	obj1.eat(); // call Man.eat()\r\n	Human obj2 = (Human) obj1;\r\n	obj2.eat(); // call Man.eat()\r\n	Man obj3 = (Man) obj2;\r\n	obj3.eat(); // call Man.eat()\r\n  }\r\n}\r\n```', '', '4');
INSERT INTO `exercise` VALUES ('1002', '34', '1', '计算 A+B\r\n输入：两个整数 a,b (0<=a,b<=10)\r\n输出：a+b\r\n样例输入：\r\n1 2\r\n样例输出：\r\n3','','5');

-- ----------------------------
-- Table structure for `homework`
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', 'Java第一次作业', 'Java第一次作业\r\n截至时间：2023.04.20\r\n一共5题', '7');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `new_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('19', 'jiaxinliang@cug.edu.cn', 'Java-对象和类', '20230374201340278.png');
INSERT INTO `image` VALUES ('20', 'jiaxinliang@cug.edu.cn', 'Java', '20230374203526524.jpg');

-- ----------------------------
-- Table structure for `knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `knowledge_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES ('20', '9', '时间复杂度分析', '## Insertion sort\r\n\r\nPesudocode:\r\n```\r\nINSERTION-SORT(A)\r\nfor j from 2 to A.length\r\n    key <- A[j]\r\n    i <- j - 1\r\n    while i > 0 and A[i] > key\r\n        A[i + 1] <- A[i]\r\n        i <- i - 1\r\n    A[i + 1] <- key\r\n```\r\n\r\n## Analysis of algorithms\r\n\r\nAnalysis of algorithms is to find the relation between input and its running time.\r\n\r\nrunning time: the number of primitive operations/steps\r\n\r\n> for `INSERTION-SORT`:\r\n>\r\n> Worst-case analysis: $1+2+\\cdots+(n-1) = \\frac{n(n-1)}{2} = \\frac{n^2}{2} - \\frac{n}{2}$;\r\n>\r\n> Order of growth: $\\Theta(n^2)$\r\n>\r\n> Average case analysis: $\\frac{n(n-1)}{4} = \\frac{n^2}{4} - \\frac{n}{4}$\r\n>\r\n> Order of growth: $\\Theta(n^2)$\r\n\r\nFormally,\r\n\r\n$\\Theta(g(n)) = f(n)$: there exists positive constant $c_1$, $c_2$ and $n_0$ such that $0 \\leq c_1g(n) \\leq f(n) \\leq c_2g(n)$ for all $n \\geq n_0$;\r\n\r\n$O(g(n)) = f(n)$: there exists positive constant $c$ and $n_0$ such that $0 \\leq f(n) \\leq cg(n)$ for all $n \\geq n_0$.\r\n\r\nIf we want to prove $\\frac{n^2}{2}-3n=\\Theta(n^2)$, we can assume $c_1n^2 \\leq \\frac{n^2}{2}-3n \\leq c_2n^2$.\r\n\r\n$$\r\nc_1n^2 \\leq \\frac{n^2}{2}-3n \\leq c_2n^2 \\\\\r\n\\Rightarrow c_1 \\leq \\frac{1}{2}-\\frac{3}{n} \\leq c_2\r\n$$\r\n\r\nLet $c_1 = \\frac{1}{4}, c_2 = \\frac{1}{2}$.');
INSERT INTO `knowledge` VALUES ('21', '9', '分治算法', '## Divide and conquer\r\n\r\nMany Algorithms are recursive in structure. These algorithm call itself one or more times to deal with the closely related **subproblem** with similar structure.\r\n\r\nSteps:\r\n- Divide: Break the problem into several subproblems that are similar to the original problem, but smaller in size.\r\n- Conquer: Solve the subproblem recursively. when subproblem is small enough, solve the subproblem straightforward.\r\n- Combine: Combine the solutions to the subproblems to the original problem.');
INSERT INTO `knowledge` VALUES ('22', '9', '归并排序', '## Merge sort\r\n\r\n- Divide: Divide the n-element sequence into 2 sub sequences of n/2 elements each.\r\n- Conquer: Sort 2 sub sequences using merge sort.\r\n- Combine: Merge the **sorted** sub sequences to provide the answer.\r\n\r\nPesudocode:\r\n```\r\nMERGE(A, p, q, r)\r\n    n1 <- q - p + 1\r\n    n2 <- r - q\r\n    for i <- 1 to n1\r\n        L[i] <- A[p + i - 1]\r\n    for j <- 1 to n2\r\n        R[i] <- A[q + j]\r\n    L[n1 + 1] <- infinity\r\n    R[n2 + 1] <- infinity\r\n    i <- 1, j <- 1\r\n    for k from p to r\r\n        if L[i] <= R[j]\r\n            A[k] <- L[i]\r\n            i <- i + 1\r\n        else \r\n            A[k] <- R[j]\r\n            j <- j + 1\r\n\r\nMERGESORT(A, p, r)\r\n    if p < r\r\n        q <- FLOOR(((p + r) / 2)\r\n        MERGESORT(A, p, q)\r\n        MERGESORT(A, q + 1, r)\r\n        MERGE(A, p, q, r)\r\n```\r\n\r\n## Runtime of Merge Sort\r\n\r\n$$\r\nT(n) = \\begin{cases}\r\n    1,n=1\\\\\r\n    2T(\\frac{n}{2}) + \\Theta(n), n\\geq 2\r\n\\end{cases}\r\n$$\r\n\r\n### Induction/ Substitution Method\r\n- Step 1: \r\n  When $n_0 = 2$, there exists a constant $c$ such that $T(n_0) \\leq c(2\\lg2)$.\r\n- Step 2:\r\n  $$\r\n  T(n) = 2T(\\frac{n}{2}) + \\Theta(n)\\\\\r\n  \\leq 2(c\\frac{n}{2}\\lg \\frac{n}{2}) + cn\\\\\r\n  = cn\\lg n - cn\\lg2 + cn\\\\\r\n  = cn\\lg n.\r\n  $$\r\n\r\n## Master Theorem\r\n\r\nLet $a \\geq 1$, $b > 1$ be constants, $f(n)$ be a function and $T(n)$ be defined by recurrence:\r\n$$T(n) = aT(\\frac{n}{b}) + f(n)$$\r\n\r\n1. If $f(n) = O(n^{\\log _b a - \\epsilon})$ for some constant $\\epsilon > 0$, then $T(n) = \\Theta(n^{\\log _b a})$;\r\n2. If $f(n) = \\Theta (n^{\\log _b a})$, then $T(n) = \\Theta(n^{\\log _b a}\\lg n)$;\r\n3. If $f(n) = \\Omega (n^{\\log _b a + \\epsilon})$ for some constant $\\epsilon > 0$, and if $af(\\frac{n}{b})\\leq cf(n)$ for some constant $c < 1$ and sufficiently large $n$, then $T(n) = \\Theta(f(n))$.');
INSERT INTO `knowledge` VALUES ('23', '9', '快速排序', '## Quick Sort\r\n\r\n1. Divide: Divide A[p, ..., r] into 2 subs: A[p, ..., q-1], A[q+1, ..., r] s.t. elements in the formal smaller than A[q] and  the latter larger than A[q].\r\n2. Conquer: Sort 2 subs recursively by calling `Quicksort`.\r\n3. Combine: Do nothing.\r\n\r\n```\r\nQUICKSORT(A, p, r)\r\n	if p < r\r\n		q = PARTITION(A, p, r)\r\n		QUICKSORT(A, p, q - 1)\r\n		QUICKSORT(A, q + 1, r)\r\n\r\nPARTITION(A, p, r)\r\n	x = A[r]\r\n	i = p - 1\r\n	for j = p to r - 1\r\n		if A[j] <= x\r\n			i = i + 1\r\n			exchange A[i] with A[j]\r\n	exchange A[i + 1] with A[r]\r\n	return i + 1\r\n```\r\n\r\n## Time Complexity\r\n\r\n$$\r\nT(n) = T(q) + T(n-q-1) + \\Theta(n)\r\n$$\r\n\r\n### Worst case\r\n\r\n$$\r\nT(n) = T(n - 1)  + \\Theta(n)\\\\\r\nT(n) = \\Theta(n^2)\r\n$$\r\n\r\n### Best case\r\n\r\n$$\r\nT(n) = 2T(\\frac{n}{2}) + \\Theta(n)\\\\\r\nT(n) = \\Theta(n\\log n)\r\n$$');
INSERT INTO `knowledge` VALUES ('24', '9', '堆排序', '## Heap\r\n\r\nA heap is an array with special structure.\r\n\r\nThe root of a heap is A[1]. For any element i in the array, it **may** have a parent, a left child and a right child.\r\n\r\n```\r\nPARENT(i)\r\n    return floor(i/2)\r\nLEFT(i)\r\n    return 2i\r\nRIGHT(i)\r\n    return 2i+1\r\n```\r\n\r\nHeap property:\r\n\r\n- Max Heap: `A[PARENT(i)]` >= `A[i]`\r\n- Min Heap: `A[PARENT(i)]` <= `A[i]`\r\n\r\n## Build a heap\r\n\r\n`MAX-HEAPIFY(A, i)` is based on the assumption that 2 trees rooted at `LEFT(i)` and `RIGHT(i)` are heaps.\r\n\r\n```\r\nMAX-HEAPIFY(A, i)\r\n    l = LEFT(i); r = RIGHT(i)\r\n    IF l <= A.size() and A[l] > A[i]\r\n        largest = l\r\n    ELSE largest = i\r\n    IF r <= A.size() and A[r] > A[i]\r\n        largest = r\r\n    IF largest != i\r\n        exchange A[largest] with A[i]\r\n        MAX-HEAPIFY(A, largest)\r\n```\r\n\r\nRuntime: $O(\\lg n)$\r\n\r\n```\r\nBUILD-HEAP(A)\r\n    FOR i from floor(A.leangth / 2) down to 1\r\n        MAX-HEAPIFY(A, i)\r\n```\r\n\r\nRuntime: $O(n) = O(n\\lg n)$\r\n\r\nHint (refer to *CLRS* for details):\r\n\r\n$$\r\nT(n) = \\sum \\limits _{h=0}^{\\lfloor\\lg n\\rfloor} \\lfloor\\frac{n}{2^{h+1}}\\rfloor O(h)\r\n$$\r\n\r\n## Heap sort\r\n\r\n```\r\nHEAP-SORT(A)\r\n    BUILD-HEAP(A)\r\n    FOR i from A.length down to 2\r\n        EXCHANGE A[1] with A[i]\r\n        A.size = A.size - 1\r\n        MAX-HEAPIFY(A, 1)\r\n```\r\n\r\nRuntime: $O(n + n\\lg n) = O(n\\lg n)$');
INSERT INTO `knowledge` VALUES ('34', '7', 'Java概述', '# Java 简介\r\nJava 是由 Sun Microsystems 公司于 1995 年 5 月推出的 Java 面向对象程序设计语言和 Java 平台的总称。由 James Gosling和同事们共同研发，并在 1995 年正式推出。\r\n\r\n后来 Sun 公司被 Oracle （甲骨文）公司收购，Java 也随之成为 Oracle 公司的产品。\r\n\r\nJava分为三个体系：\r\n\r\n- JavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）\r\n- JavaEE（J2EE）（Java 2 Platform,Enterprise Edition，java平台企业版）\r\n- JavaME（J2ME）（Java 2 Platform Micro Edition，java平台微型版）\r\n\r\n2005 年 6 月，JavaOne 大会召开，SUN 公司公开 Java SE 6。此时，Java 的各种版本已经更名，以取消其中的数字 \"2\"：J2EE 更名为 Java EE，J2SE 更名为Java SE，J2ME 更名为 Java ME。\r\n\r\n# 主要特性\r\n- **Java 语言是简单的**：\r\n\r\nJava 语言的语法与 C 语言和 C++ 语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java 丢弃了 C++ 中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java 语言不使用指针，而是引用。并提供了自动分配和回收内存空间，使得程序员不必为内存管理而担忧。\r\n\r\n- **Java 语言是面向对象的**：\r\n\r\nJava 语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为 implements）。Java 语言全面支持动态绑定，而 C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。\r\n\r\n- **Java语言是分布式的**：\r\n\r\nJava 语言支持 Internet 应用的开发，在基本的 Java 应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括 URL、URLConnection、Socket、ServerSocket 等。Java 的 RMI（远程方法激活）机制也是开发分布式应用的重要手段。\r\n\r\n- **Java 语言是健壮的**：\r\n\r\nJava 的强类型机制、异常处理、垃圾的自动收集等是 Java 程序健壮性的重要保证。对指针的丢弃是 Java 的明智选择。Java 的安全检查机制使得 Java 更具健壮性。\r\n\r\n- **Java语言是安全的**：\r\n\r\nJava通常被用在网络环境中，为此，Java 提供了一个安全机制以防恶意代码的攻击。除了Java 语言具有的许多安全特性以外，Java 对通过网络下载的类具有一个安全防范机制（类 ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类 SecurityManager）让 Java 应用设置安全哨兵。\r\n\r\n- **Java 语言是体系结构中立的**：\r\n\r\nJava 程序（后缀为 java 的文件）在 Java 平台上被编译为体系结构中立的字节码格式（后缀为 class 的文件），然后可以在实现这个 Java 平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。\r\n\r\n- **Java 语言是可移植的**：\r\n\r\n这种可移植性来源于体系结构中立性，另外，Java 还严格规定了各个基本数据类型的长度。Java 系统本身也具有很强的可移植性，Java 编译器是用 Java 实现的，Java 的运行环境是用 ANSI C 实现的。\r\n\r\n- **Java 语言是解释型的**：\r\n\r\n如前所述，Java 程序在 Java 平台上被编译为字节码格式，然后可以在实现这个 Java 平台的任何系统中运行。在运行时，Java 平台中的 Java 解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。\r\n\r\n- **Java 是高性能的**：\r\n\r\n与那些解释型的高级脚本语言相比，Java 的确是高性能的。事实上，Java 的运行速度随着 JIT(Just-In-Time）编译器技术的发展越来越接近于 C++。\r\n\r\n- **Java 语言是多线程的**：\r\n\r\n在 Java 语言中，线程是一种特殊的对象，它必须由 Thread 类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为 Thread(Runnable) 的构造子类将一个实现了 Runnable 接口的对象包装成一个线程，其二，从 Thread 类派生出子类并重写 run 方法，使用该子类创建的对象即为线程。值得注意的是 Thread 类已经实现了 Runnable 接口，因此，任何一个线程均有它的 run 方法，而 run 方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java 语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为 synchronized）。\r\n\r\n- **Java 语言是动态的**：\r\n\r\nJava 语言的设计目标之一是适应于动态变化的环境。Java 程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java 中的类有一个运行时刻的表示，能进行运行时刻的类型检查。\r\n\r\n# Java 开发工具\r\nJava 语言尽量保证系统内存在 1G 以上，其他工具如下所示：\r\n\r\n- Linux 系统、Mac OS 系统、Windows 95/98/2000/XP，WIN 7/8系统。\r\n- Java JDK 7、8……\r\n- vscode 编辑器或者其他编辑器。\r\n- IDE：Eclipse、 IntelliJ IDEA、NetBeans 等。\r\n\r\n安装好以上的工具后，我们就可以输出Java的第一个程序 \"Hello World！\"\r\n\r\n```\r\npublic class HelloWorld {\r\n    public static void main(String[] args) {\r\n        System.out.println(\"Hello World\");\r\n    }\r\n}\r\n```');
INSERT INTO `knowledge` VALUES ('35', '7', '词法规则', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec01.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('36', '7', '数据类型', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec01.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('37', '7', '常量和变量', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec01.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('38', '7', '运算符和表达式', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec01.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('39', '7', '数组和字符串', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec03.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('40', '7', '语句', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec02.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('41', '7', '面向对象的基本概念', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec04.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('42', '7', '类的定义', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec04.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('43', '7', '对象', '本节我们重点研究对象和类的概念。\r\n- 对象：对象是类的一个实例，有状态和行为。例如，一条狗是一个对象，它的状态有：颜色、名字、品种；行为有：摇尾巴、叫、吃等。\r\n- 类：类是一个模板，它描述一类对象的行为和状态。\r\n\r\n下图中汽车为类（class），而具体的每辆车为该汽车类的对象（object），对象包含了汽车的颜色、品牌、名称等。\r\n![](images/20230374201340278.png)');
INSERT INTO `knowledge` VALUES ('44', '7', '类的继承', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec07.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('45', '7', '接口和包', '点击[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec05.pdf)与[此处](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-092-introduction-to-programming-in-java-january-iap-2010/lecture-notes/MIT6_092IAP10_lec06.pdf)查看PDF文件。');
INSERT INTO `knowledge` VALUES ('46', '12', '预备知识', '## 1 二进制数\r\n\r\n### 1.1 二进制整数\r\n\r\n$$\r\nN = {b_{J}b_{J-1}\\cdots b_{0}}_2 = {\\sum\\limits_{k = 0}^{J} b_{k}\\times 2^{k}}_{10}\\\\\r\n\\\\\r\nN = 2Q_{0} + b_{0}\\\\\r\nQ_{k} = 2Q_{k+1} + b_{k+1}, k = 0,1,\\cdots,J-1\r\n$$\r\n\r\n### 1.2 二进制分数\r\n\r\n若$R\\in \\R$，且$R \\in (0, 1)$，则：\r\n\r\n$$\r\nR = {0.d_{1}d_{2}\\cdots d_{n}\\cdots}_2 = {\\sum\\limits_{k = 1}^{n} d_{k}\\times 2^{-k}}_{10}\\\\\r\n\\\\\r\nd_{1} = {\\rm int}(2R), F_{1} = {\\rm frac}(2R)\\\\\r\nd_{k} = {\\rm int}(2F_{k-1}), F_{k} = {\\rm frac}(2F_{k-1}), k = 2, 3, \\cdots, n\\\\\r\n$$\r\n\r\n### 1.3 机器数\r\n\r\n$$\r\nx \\approx q \\times 2^n\r\n$$\r\n\r\n其中，$q$为尾数且$\\frac{1}{2} \\leq q < 1$，$n$为阶码. 在任何计算机实现中，尾数和阶码的范围是有限的.\r\n\r\n譬如，在32位单精度的计算机中，阶码用8位表示，尾数用40位表示. 因此，可以表示实数范围为$2^{-2^{8-1} }-2^{2^{8-1} -1}$.\r\n\r\n## 2 误差分析\r\n\r\n绝对误差：$E_{p} = |p - \\hat{p}|$.\r\n\r\n相对误差：$R_{p} = \\frac{|p - \\hat{p}|}{|p|}$.\r\n\r\n有效数字：若$d$是满足$R_{p} < \\frac{10^{1-d}}{2}$的最大正整数，则称$\\hat{p}$近似$p$时具有$d$位有效数字.');
INSERT INTO `knowledge` VALUES ('47', '12', '求解x=g(x)的迭代法', 'Definition 1 函数$g(x)$**不动点**是指一个实数$P$ s.t. $P = g(P)$.\r\n\r\nDefinition 2 迭代$p_{n+1} = g(p_{n}), n = 0,1,\\cdots$称为不动点迭代. \r\n\r\nTheorem 1 $g$是一个连续函数，$p_n$是由不动点迭代生成的数列. 如果$\\lim_{n\\rightarrow +\\infty} {p_n}= P$，则$P$是$g(x)$的不动点. \r\n\r\nProof:\r\n\r\n$$\r\ng(P) = g(\\lim_{n\\rightarrow +\\infin} {p_n}) = \\lim_{n\\rightarrow +\\infin}g(p_n) = \\lim_{n\\rightarrow +\\infin}p_{n+1} = \\lim_{n\\rightarrow +\\infin}p_{n} = P\r\n$$\r\n\r\nTheorem 2 函数$g\\in C[a,b]$. 若$x\\in [a, b]$时，$g(x)\\in [a, b]$，则$g$在$[a, b]$内存在不动点；且若$g\\in D[a,b]$且存在$0<K<1$，使$|g\\prime(x)| \\leq K < 1$，则$g$在$[a, b]$内有唯一的不动点. \r\n\r\nProof:\r\n\r\nOf theorem 2.1\r\n\r\n$$\r\ng(a)-a \\geq 0, \r\ng(b)-b \\leq 0, \r\n[g(a)-a][g(b)-b] \\leq 0\r\n$$\r\n\r\nOf theorem 2.2\r\n\r\nAssume that $g(a)=a, g(b) = b$, there exists $x$ s.t. $g\\prime(x) = \\frac{g(b)-g(a)}{b-a} = 1$.\r\n\r\nTheorem 3 \r\n\r\n设有（i）$g,g\\prime \\in C[a, b]$，（ii）$K>0$，（iii）$p_0 \\in (a, b)$，（iv）$g(x)\\in [a, b]$ s.t. $x\\in [a, b]$.\r\n\r\n若$|g\\prime(x)| \\leq K < 1$，则迭代$p_{n+1} = g(p_{n})$将收敛到唯一的不动点$P$，$P$被称为吸引不动点；若$|g\\prime(x)| > 1$，则迭代$p_{n+1} = g(p_{n})$将不会收敛到$P$，$P$被称为排斥不动点. \r\n\r\nProof:\r\n\r\n$$\r\n|p_{n} - P| = |g(p_{n-1})\\cdot g(P)| = |g\\prime (x_0)\\cdot (p_{n-1} - P)| = |g\\prime (x_0)|\\cdot |p_{n-1}-P| \\leq K|p_{n-1}-P|\\\\\r\n0 \\leq |p_{n} - P| \\leq K^n|p_{0}-P|\\\\\r\n\\lim_{n \\rightarrow +\\infin}|p_{n} - P| = 0\r\n$$');
INSERT INTO `knowledge` VALUES ('48', '12', '定位根的全局收敛法', '## 1 波尔查诺二分法\r\n\r\n<img src=\"images/202112351221444532.png\" alt=\"drawing\" width=\"1000\"/>\r\n\r\nTheorem 1 若$f \\in C(a, b)$且存在$r \\in [a, b]$ s.t. $f(r) = 0$. 如果$f(a)f(b) < 0$且$c_n$表示波尔查诺二分法中的中点序列，则\r\n\r\n$$\r\n|r - c_n| \\leq \\frac{b - a}{2^{n+1}}\\\\\r\n\\lim_{n \\rightarrow\\infin} c_n = r\r\n$$\r\n\r\nProof: \r\n\r\n$$\r\n|r - c_n| \\leq \\frac{b_n - a_n}{2} = \\frac{b - a}{2^{n+1}}\r\n$$\r\n\r\n## 2 试值法\r\n\r\n<img src=\"images/202112351221427119.png\" alt=\"drawing\" width=\"1000\"/>\r\n\r\n$$\r\nc_n = b_n - \\frac{f(b_n)(b_n - a_n)}{f(b_n) - f(a_n)}\r\n$$\r\n\r\n## 3 收敛判定准则\r\n\r\n与横坐标有关的收敛判定：\r\n\r\n$$\r\n|p_n - p_{n-1}| < \\delta\\\\\r\n\\frac{2|p_n - p_{n-1}|}{|p_n| + |p_{n-1}|} < \\delta\r\n$$\r\n\r\n与纵坐标有关的收敛判定：\r\n\r\n$$\r\n|f(p_n)| < \\epsilon\r\n$$');
INSERT INTO `knowledge` VALUES ('49', '12', '定位根的局部收敛法', '## 1 初始近似值\r\n\r\n波尔查诺二分法与试值法属于全局收敛法，依赖于寻找的区间$[a, b]$，只要$f(a)f(b)<0$，迭代总能找到一个根. \r\n\r\n牛顿-拉夫森法和割线法属于局部收敛法，要求给定一个接近根的近似值以保证收敛. \r\n\r\n## 2 牛顿-拉夫森法\r\n\r\n<img src=\"images/202112351221415614.png\" alt=\"drawing\" width=\"1000\"/>\r\n\r\nTheorem 1 设$f \\in C^2[a, b]$，且存在数$p \\in [a, b]$，满足$f(p)=0$. 如果$f\\prime(p) ≠ 0$，则存在一个数$\\delta > 0$，对任意初始近似值$p_0 \\in [p-\\delta, p+\\delta]$，使得由如下迭代定义的序列$p_n$收敛到$p$：\r\n\r\n$$\r\np_k = g(p_{k-1}) = p_{k-1} - \\frac{f(p_{k-1})}{f\\prime(p_{k-1})}\r\n$$\r\n\r\n其中，函数$g(x) = x - \\frac{f(x)}{f\\prime(x)}$被称为牛顿-拉夫森迭代函数. 由于$f(p)=0$时，$g(p) = p$. 牛顿-拉夫森迭代的过程也就是寻找函数$g(p)$不动点的过程. \r\n\r\n由此推导出求平方根$\\sqrt{A}$的牛顿迭代. 此时，\r\n\r\n$$\r\nf(x) = x^2 - A, f\\prime(x) = 2x, g(x) = \\frac{x^2 + A}{2x}\r\n$$\r\n\r\n可以证明，对于任意的初始值$p_0 > 0$，迭代将收敛. \r\n\r\nProof：\r\n\r\n$$\r\ng\\prime(x) = \\frac{f(x)f\\prime\\prime(x)}{(f\\prime(x))^2}\\\\\r\nf(x) = 0 \\Leftrightarrow g\\prime(x) = 0\r\n$$\r\n\r\n由于$f \\in C^2[a, b]$，因此能找到$\\delta>0$，$x \\in (p-\\delta, p+\\delta)$时，$|g\\prime(x)| < 1$.\r\n\r\n对于求平方根$\\sqrt{A}$的情形，$g\\prime(x) = \\frac{1}{2}(1 - \\frac{A}{x^2}) \\in (-1, 1) \\Rightarrow x > \\sqrt{\\frac{A}{3}}$. 但考虑到$p_0 > 0$时，$p_1 = g(p_0) = \\frac{x + \\frac{A}{x}}{2} \\geq \\sqrt{A}$，于是对于任意的初始值$p_0 > 0$，迭代将收敛. \r\n\r\nDefinition 1 设序列$p_n$收敛到$p$，并令$E_n = p - p_n$，若存在$A \\neq 0, R > 0$ s.t. \r\n\r\n$$\r\n\\lim_{n \\rightarrow \\infin}\\frac{|E_{n+1}|}{|E_n|^R} = A\r\n$$\r\n\r\n则该序列称为以收敛阶$R$收敛到$p$，数$A$为渐进误差常数. \r\n\r\n特别的，若$R = 1$，则称序列$p_n$的收敛性为线性收敛；若$R = 2$，则称序列$p_n$的收敛性为二次收敛. \r\n\r\nTheorem 2 对于牛顿-拉夫森迭代，\r\n\r\n若$p$是单根，则是二次收敛的，且对于足够大的$n$有\r\n\r\n$$\r\n|E_{n+1}| \\approx \\frac{|f\\prime\\prime(p)|}{2|f\\prime(p)|}|E_n|^2\r\n$$\r\n\r\n若$p$是$M$阶多重根根，则是线性收敛的，且对于足够大的$n$有\r\n\r\n$$\r\n|E_{n+1}| \\approx \\frac{M-1}{M}|E_n|\r\n$$\r\n\r\nTheorem 3 设牛顿-拉夫森算法产生的序列线性收敛到$M$阶多重根根$x=p$，其中$M > 1$，则牛顿-拉夫森迭代公式\r\n\r\n$$\r\np_k = p_{k-1} - \\frac{Mf(p_{k-1})}{f\\prime(p_{k-1})}\r\n$$\r\n\r\n将产生一个二次收敛的序列. \r\n\r\n## 3 割线法\r\n\r\n<img src=\"images/202112351221404036.png\" alt=\"drawing\" width=\"1000\"/>\r\n\r\n$$\r\np_{k+1} = p_{k} - \\frac{f(p_k)(p_k - p_{k-1})}{f(p_k) - f(p_{k-1})}\r\n$$\r\n\r\n割线法的收敛阶$R = \\frac{1 + \\sqrt{5}}{2}$.');
INSERT INTO `knowledge` VALUES ('50', '12', '求解AX=B的高斯消元和LU分解法', 'Theorem 1 若$\\det(U) = a_{11}a_{22}\\cdots a_{NN} \\neq 0$，则$UX=Y$存在唯一解\r\n\r\n$$\r\nx_N = \\frac{a_{NN}}{b_N}\\\\\r\nx_k = \\frac{b_k - \\sum \\limits_{j=k+1}^N{a_{kj}x_j}}{a_{kk}}, k < N\r\n$$\r\n\r\n## 1 高斯消元法\r\n\r\n### 1.1 高斯消元\r\n\r\nTheorem 2 若$A$是非奇异矩阵，则存在线性方程组$UX=Y$与线性方程组$AX=B$等价，且$u_{kk} ≠ 0$. 于是，可以采用高斯消元法得到$UX=Y$，即可用Theorem 1中的方法求解$X$. \r\n\r\n### 1.2 主元选择\r\n\r\n值得注意的是，在高斯消元的时候，会遇到待选取的主元$a_{pp}^{(p)}=0$的情况，这个时候可以采取平凡选主元策略，寻找第$p$行下满足$a_{pp}^{(p)}≠0$的第一行并交换. \r\n\r\n为了**减少误差的传播**，可以使用**偏序选主元策略**或按**比例偏序选主元策略**（平衡策略）. \r\n\r\n偏序选主元策略即寻找$a_{kp}$作为主元，$k$满足：\r\n\r\n$$\r\n|a_{kp}| = \\max_{p\\leq i\\leq N}{|a_{ip}|}\r\n$$\r\n\r\n按比例偏序选主元策略即寻找$a_{kp}$作为主元，$k$满足：\r\n\r\n$$\r\n\\frac{|a_{kp}|}{s_k} = \\max_{p\\leq i\\leq N}{\\frac{|a_{ip}|}{s_i}}\r\n$$\r\n\r\n其中$s_i$为在高斯消去的过程中每一行绝对值最大的元素. \r\n\r\n### 1.3 病态情况\r\n\r\n若存在矩阵$B$，当$B$或$A$中的系数的 微小变化使得$X$变化很大时，则称矩阵$A$为病态矩阵，方程组$AX=B$称为病态方程组. \r\n\r\n当$A$的行列式接近于零的时候，可能发生病态情况. \r\n\r\n## 2 $LU$分解法\r\n\r\n$$\r\nAX = B,A = LU\\\\\r\n\\Rightarrow LUX = L(UX) = B\\\\\r\n\\Rightarrow UX = L^{-1}B\\\\\r\n\\Rightarrow X = U^{-1}L^{-1}B\r\n$$\r\n\r\n一般情况下，通过无行交换变换的高斯消元法可以进行$LU$分解. 但有的时候，需要进行行变换：\r\n\r\n$$\r\nAX = B \\Rightarrow PAX = PB, PA = LU\\\\\r\n\\Rightarrow LUX = PB\r\n$$\r\n\r\n## 3 复杂度分析\r\n\r\n对于高斯消元：\r\n\r\n```python\r\ndef uptrbk(A: list, b: list):\r\n    \"\"\"\r\n    To solve linear equation like Ax = b\r\n    :param A: an N*N matrix\r\n    :param b: an N*1 matrix\r\n    :return: x, an N*1 matrix\r\n    \"\"\"\r\n    n = len(b)\r\n    for p in range(n - 1):\r\n        max_pivot = abs(A[p][p]); max_index = p\r\n        for i in range(p + 1, n):\r\n            if abs(A[i][p]) > max_pivot:\r\n                max_pivot = abs(A[i][p])\r\n                max_index = i\r\n        if max_pivot == 0:\r\n            print(\"A was singular!\")\r\n            return\r\n        if max_index != p:\r\n            A[max_index], A[p] = A[p], A[max_index]\r\n            b[max_index], b[p] = b[p], b[max_index]\r\n        for i in range(p + 1, n):\r\n            factor = A[i][p] / A[p][p]\r\n            A[i][p] = 0\r\n            b[i][0] = b[i][0] - factor * b[p][0]\r\n            for j in range(p + 1, n):\r\n                A[i][j] = A[i][j] - factor * A[p][j]\r\n    return backsub(A, b)\r\n```\r\n\r\n需要的计算为：\r\n\r\n$$\r\n\\sum \\limits _{p=0}^{N-2}{((N-p-1) + (N-p-1)^2)} = O(n^3)\r\n$$\r\n\r\n对于回代法：\r\n\r\n```python\r\ndef backsub(U: list, y: list):\r\n    \"\"\"\r\n    To solve linear equation like Ux = y\r\n    :param U: an N*N matrix\r\n    :param y: an N*1 matrix\r\n    :return: x, an N*1 matrix\r\n    \"\"\"\r\n    n = len(y)\r\n    x = [[y[n - 1][0] / U[n - 1][n - 1]]]\r\n    for k in range(n - 2, -1, -1):\r\n        ux = 0\r\n        for i in range(k + 1, n):\r\n            ux += x[n - 1 - i][0] * U[k][i]\r\n        x.append([(y[k][0] - ux) / U[k][k]])\r\n    x.reverse()\r\n    return x\r\n```\r\n\r\n需要的计算为：\r\n\r\n$$\r\n\\sum \\limits _{k=1}^{n-1}{(k-1)} = O(n^2)\r\n$$\r\n\r\n因此，计算量主要是由高斯消元造成的. 因此，对于固定的$A$，在$b$变化的情况下，只需要进行一次高斯消元，接着根据不同的$b$进行回代；也就是在实际计算中，往往采用$LU$分解法求解线性方程组. MATLAB中的`inv(A)`与`det(A)`也利用$LU$分解法. ');
INSERT INTO `knowledge` VALUES ('51', '12', '求解AX=B的迭代法', '雅可比迭代：\r\n\r\n$$\r\nx^{(k+1)}_j = \\frac{b_j - \\sum \\limits_{i\\in[1,N]-\\{j\\}}{a_{ji}x_i^{(k)}}}{a_{jj}}\r\n$$\r\n\r\n高斯-赛德尔迭代：\r\n\r\n$$\r\nx^{(k+1)}_j = \\frac{b_j - \\sum \\limits_{i=1}^{j-1}{a_{ji}x_i^{(k+1)}}-\\sum \\limits_{i=j+1}^{N}{a_{ji}x_i^{(k)}}}{a_{jj}}\r\n$$\r\n\r\nDefinition 1 对于$N\\times N$的矩阵$A$，如果$|a_{kk} > \\sum \\limits_{j=1,j≠k}^{N}{|a_{kj}|}|$，则称矩阵$A$具有严格对角优势. \r\n\r\nTheorem 1 矩阵$A$具有严格对角优势，则$AX=B$有唯一解$X=P$，且对于任意初始向量$P_0$，雅可比迭代序列都将收敛到$P$，高斯-赛德尔迭代也会收敛. \r\n\r\n判断序列是否收敛需要比较向量之间的距离，计算欧几里得距离需要较大的计算量，因此引入另一种范数$||X||_1=\\sum \\limits_{j=1}^N{|x_j|}$.\r\n\r\n这样的迭代法可以扩展到非线性方程组，以下将以三维非线性方程组为例：\r\n\r\n不动点迭代：\r\n\r\n$$\r\np_{k+1} = g_1(p_k, q_k, r_k)\\\\\r\nq_{k+1} = g_2(p_k, q_k, r_k)\\\\\r\nr_{k+1} = g_3(p_k, q_k, r_k)\\\\\r\n$$\r\n\r\n赛德尔迭代：\r\n\r\n$$\r\np_{k+1} = g_1(p_k, q_k, r_k)\\\\\r\nq_{k+1} = g_2(p_{k+1}, q_k, r_k)\\\\\r\nr_{k+1} = g_3(p_{k+1}, q_{k+1}, r_k)\\\\\r\n$$\r\n\r\n非线性方程组的牛顿法：\r\n\r\n设有\r\n\r\n$$\r\nu = f_1(x, y)\\\\\r\nv = f_2(x, y)\r\n$$\r\n\r\n于是\r\n\r\n$$\r\n\\mathrm{d}u = \\frac{\\partial f_1}{\\partial x}\\mathrm{d}x + \\frac{\\partial f_1}{\\partial y}\\mathrm{d}y\\\\\r\n\\mathrm{d}v = \\frac{\\partial f_2}{\\partial x}\\mathrm{d}x + \\frac{\\partial f_2}{\\partial y}\\mathrm{d}y\r\n$$\r\n\r\n故\r\n\r\n$$\r\n\\mathrm{d}X = J^{-1}\\mathrm{d}F\\\\\r\nX_k = X_{k-1} + J^{-1}(X_{k-1})(O-F(X_{k-1})) = X_{k-1} - J^{-1}(X_{k-1})F(X_{k-1})\r\n$$\r\n\r\n这就是一元牛顿法的一般化. \r\n');
INSERT INTO `knowledge` VALUES ('52', '12', '插值与逼近', '何为多项式逼近？\r\n\r\n$$\r\nf(x) = P_N(x) + E_N(x)\r\n$$\r\n\r\n## 1 泰勒多项式逼近\r\n\r\n设$f \\in C^{N+1}[a, b], x_0 \\in [a, b]$，若$x \\in [a, b]$，则有：\r\n\r\n$$\r\nP_N(x) = \\sum \\limits_{k=0}^N{\\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k}\\\\\r\nE_N(x) = \\frac{f^{(N+1)}(c)}{(N+1)!}(x-x_0)^{N+1},c=c(x)介于x与x_0之间\r\n$$\r\n\r\n多项式计算方法（嵌套乘法）：\r\n\r\n```\r\nPoly = A(N)\r\nFOR K = N - 1 DOWNTO 0\r\n	DO Poly = A(K) + Poly * X\r\nPRINT \"The value P(x) is\", Poly\r\n```\r\n\r\n同样可以用于求导与积分：\r\n\r\n```\r\nDeriv = N * A(N)\r\nFOR K = N - 1 DOWNTO 1\r\n	DO Deriv = K * A(K) + Deriv * X\r\nPRINT \"The value P\'(x) is\", Deriv\r\n\r\nInteg = A(N) / (N + 1)\r\nFOR K = N DOWNTO 1\r\n	DO Integ = A(K - 1) / K + Integ * X\r\nInteg = C + Integ * X\r\nPRINT \"The value I(x) is\", Integ\r\n```\r\n\r\n## 2 拉格朗日逼近\r\n\r\n首先考虑线性插值：\r\n\r\n$$\r\ny = P(x) = y_0 + \\frac{y_1 - y_0}{x_1 - x_0}(x - x_0)\r\n$$\r\n\r\n经过改写，可以得到：\r\n\r\n$$\r\ny = P_1(x) = \\frac{x - x_1}{x_0 - x_1}y_0 + \\frac{x - x_0}{x_1 - x_0}y_1\\\\\r\nL_{1,0} = \\frac{x - x_1}{x_0 - x_1},L_{1,1} = \\frac{x - x_0}{x_1 - x_0}\r\n$$\r\n\r\n一般地，有：\r\n\r\n$$\r\nP_N(x) = \\sum\\limits_{k=0}^N{y_kL_{N,k}(x)}\\\\\r\nL_{N,k}(x) = \\frac{\\prod\\limits_{j=0,j≠k}^{N}(x-x_j)}{\\prod\\limits_{j=0,j≠k}^{N}(x_k-x_j)}\\\\\r\nL_{N,k}(x) = 1,x=x_k\\\\\r\nL_{N,k}(x) = 0,x=x_1,\\cdots,x_{k-1},x_{k+1},\\cdots,x_{N}\r\n$$\r\n\r\n### 误差项$E_N(x)$\r\n\r\n设$f \\in C^{N+1}[a, b], x_j \\in [a, b]$，若$x \\in [a, b]$，则有：\r\n\r\n$$\r\nP_N(x) = \\sum\\limits_{k=0}^N{y_kL_{N,k}(x)}\\\\\r\nE_N(x) = \\frac{f^{(N+1)}(c)}{(N+1)!}\\prod\\limits_{j=0}^{N}(x-x_j),c=c(x)介于x与x_0之间\r\n$$\r\n\r\n下面证明$N = 1$的情形。定义函数$g(t)$:\r\n\r\n$$\r\ng(t) = f(t) - P_1(t) - E_1(x)\\frac{(t-x_0)(t-x_1)}{(x-x_0)(x-x_1)}\\\\\r\ng(x) = 0,g(x_0) = 0,g(x_1) = 0\\\\\r\n\\exist d_0\\in[x_0,x],d_1\\in[x,x_1], g^\\prime(d_0) = 0,g^\\prime(d_1) = 0\\\\\r\n\\exist c\\in[d_0,d_1]\\subset[x_0,x_1], g^{(2)}(c) = 0\\\\\r\ng^{(2)}(c) = f^{(2)}(c)-0- E_1(x)\\frac{2}{(x-x_0)(x-x_1)}=0\\\\\r\nE_1(x) = \\frac{(x-x_0)(x-x_1)}{2}f^{(2)}(c)\r\n$$\r\n\r\n可以证明，对于等距（$h$）节点拉格朗日多项式的误差界为$O(h^{N+1})$.\r\n\r\n## 3 牛顿多项式\r\n\r\n拉格朗日多项式中，$P_{N-1}(x),P_N(x)$没有构造上的联系，而对于牛顿多项式有：\r\n\r\n$$\r\nP_1(x) = a_0 + a_1(x - x_0)\\\\\r\nP_N(x) = P_{N-1}(x) + a_N(x-x_0)\\cdots(x-x_{N-1})\r\n$$\r\n\r\n牛顿多项式的系数是这样确定的：\r\n\r\n$$\r\nf(x_0) = P_1(x_0) = a_0\\\\\r\nf(x_1) = P_1(x_1) = a_0 + a_1(x_1 - x_0)\\\\\r\na_0 = f(x_0),a_1 = \\frac{f(x_1) - f(x_0)}{x_1 - x_0}\r\n$$\r\n\r\n对于$P_2(x)$，继续有：\r\n\r\n$$\r\nP_2(x) = a_0 + a_1(x - x_0) + a_2(x-x_0)(x-x_1)\\\\\r\nf(x_2) = P_2(x) = 0\\\\\r\na_2 = \\frac{f(x_2)-\\frac{f(x_1) - f(x_0)}{x_1 - x_0}(x_2-x_0)-f(x_0)}{(x_2-x_0)(x_2-x_1)}\r\n=\\frac{\\frac{f(x_2) - f(x_1)}{x_2 - x_1} - \\frac{f(x_1) - f(x_0)}{x_1 - x_0}}{x_2-x_0}\r\n$$\r\n\r\n因此，我们定义函数$f(x)$的差商：\r\n\r\n$$\r\nf[x_k] = f(x_k)\\\\\r\nf[x_{k-j},\\cdots,x_k] = \\frac{f[x_{k-j+1},\\cdots,x_k]-f[x_{k-j},\\cdots,x_{k-1}]}{x_k - x_{k-j}}\r\n$$\r\n\r\n牛顿多项式的系数$a_k = f[x_0,\\cdots,x_k]$.\r\n\r\n设$f \\in C^{N+1}[a, b], x_j \\in [a, b]$，若$x \\in [a, b]$，则有：\r\n\r\n$$\r\nE_N(x) = \\frac{f^{(N+1)}(c)}{(N+1)!}\\prod\\limits_{j=0}^{N}(x-x_j),c=c(x)介于x与x_0之间\r\n$$\r\n\r\n## 4 切比雪夫多项式\r\n\r\n综前所述，拉格朗日多项式和牛顿多项式都满足：\r\n\r\n$$\r\nf(x) = P_N(x) + E_N(x)\\\\\r\nE_N(x) = Q(x)\\frac{f^{(N+1)}(c)}{(N+1)!}\\\\\r\n|E_N(x)| \\leq |Q(x)|\\frac{\\max\\limits_{x\\in[-1,1]}{|f^{(N+1)}(c)|}}{(N+1)!}\\\\\r\n$$\r\n\r\n因此，我们需要选择节点集合$x_j$使得$\\max\\limits_{x\\in[-1,1]}|Q(x)|$最小.\r\n\r\n切比雪夫多项式可以按如下方式生成：\r\n\r\n$$\r\nT_0(x)=1,T_1(x)=x\\\\\r\nT_k(x) = 2xT_{k-1}(x) - T_{k-2}(x)\r\n$$\r\n\r\n$T_N(x)$在$[-1,1]$上可以用三角函数表示：\r\n\r\n$$\r\nT_N(x) = \\cos{(N\\arccos{x})}\r\n$$\r\n\r\n$T_N(x)$在$[-1,1]$上不同的零点$x_k = \\cos{\\frac{(2k+1)\\pi}{2N}}$称为切比雪夫点. 当节点集合$x_j$为切比雪夫点时，可以使得$\\max\\limits_{x\\in[-1,1]}|Q(x)|$最小，也可以证明切比雪夫插值产生的多项式序列$\\{P_N(x)\\}$在$[-1,1]$一致收敛于$f(x)$.\r\n\r\n当需要插值的区间为$[a,b]$时，需要进行变换：\r\n\r\n$$\r\nx = (\\frac{b-a}{2})t + \\frac{a+b}{2},t\\in [-1,1],x\\in [a,b]\r\n$$\r\n\r\n简要介绍切比雪夫插值多项式：\r\n\r\n$$\r\nP_N(x) = \\sum\\limits_{k=0}^Nc_kT_k(x)\\\\\r\nc_0 = \\frac{1}{N+1}\\sum\\limits_{k=0}^N{f(x_k)T_0(x_k)}\\\\\r\nc_j = \\frac{2}{N+1}\\sum\\limits_{k=0}^N{f(x_k)T_j(x_k)}\\\\\r\n$$\r\n\r\n## 5 帕徳逼近\r\n\r\n帕徳逼近是有理函数逼近，下面简要列出其的式子.\r\n\r\n$$\r\nR_{N,M}(x) = \\frac{P_N(x)}{Q_M(x)}\\\\\r\nP_N(x) = p_0 + p_1x + p_2x^2 + \\cdots + p_Nx^N\\\\\r\nQ_N(x) = 1 + q_1x + q_2x^2 + \\cdots + q_Mx^M\r\n$$\r\n\r\n设$f(x)$是解析的，于是有麦克劳林展开，于是记\r\n\r\n$$\r\nZ(x) = f(x)Q_M(x) - P_N(x)\r\n$$\r\n\r\n$f(x)$与$R_{M,N}(x)$在$x=0$处的前$N+M$阶导相等，可以得到若干方程组并求解$p,q$.');
INSERT INTO `knowledge` VALUES ('53', '12', '最小二乘法', '# 最小二乘法\r\n\r\n## 1 最小二乘曲线\r\n\r\n最小二乘拟合曲线$y=f(x) = Ax + B$是满足均方根误差$E(f) = \\sqrt{\\frac{\\sum\\limits_{k=1}^N{|f(x_k)-y_k|^2}}{N}}$最小的曲线。\r\n\r\n$$\r\nE(A, B) = \\sum\\limits_{k=1}^N{(Ax_k + B - y_k)^2}\\\\\r\n\\frac{\\partial E}{\\partial A} = \\sum\\limits_{k=1}^N{2(Ax_k + B - y_k)x_k} = \\sum\\limits_{k=1}^N{2(Ax_k^2 + Bx_k - x_ky_k)}\\\\\r\n\\frac{\\partial E}{\\partial B} = \\sum\\limits_{k=1}^N{2(Ax_k + B - y_k)}\\\\\r\n\\begin{cases}\r\n\\frac{\\partial E}{\\partial A} = 0\\\\\r\n\\frac{\\partial E}{\\partial B} = 0\r\n\\end{cases}\\rightarrow\r\n\\begin{pmatrix}\r\n\\sum\\limits_{k=1}^N{x_k^2} & \\sum\\limits_{k=1}^N{x_k}\\\\\r\n\\sum\\limits_{k=1}^N{x_k} & N\r\n\\end{pmatrix}\r\n\\begin{pmatrix}\r\nA\\\\B\r\n\\end{pmatrix} = \r\n\\begin{pmatrix}\r\n\\sum\\limits_{k=1}^N{x_ky_k}\\\\\r\n\\sum\\limits_{k=1}^N{y_k}\r\n\\end{pmatrix}\r\n$$\r\n\r\n对于$y = f(x) = Ax^M$，同理\r\n\r\n$$\r\nE(A) = \\sum\\limits_{k=1}^N{(Ax_k^M - y_k)^2}\\\\\r\nE\'(A) = \\sum\\limits_{k=1}^N{2(Ax_k^M - y_k)x_k^M}\\\\\r\nE\'(A) = 0 \\rightarrow A = \\frac{\\sum\\limits_{k=1}^N{x_k^My_k}}{\\sum\\limits_{k=1}^N{x_k^{2M}}}\r\n$$\r\n\r\n对于例如$y = Ce^{Ax}$，可以将其线性化：$\\ln{y} = \\ln{C} + Ax$.\r\n\r\n## 2 线性最小二乘法\r\n\r\n对于$f(x) = \\sum\\limits_{j=1}^M{c_jf_j(x)}$,\r\n\r\n$$\r\nE(c_1,c_2,\\cdots,c_M) = \\sum\\limits_{k=1}^N{(f(x_k)-y_k)^2} = \\sum\\limits_{k=1}^N{(\\sum\\limits_{j=1}^M{c_jf_j(x_k)}-y_k)^2}\\\\\r\n\\frac{\\mathrm{d}E}{\\mathrm{d}C} = \r\n\\begin{pmatrix}\r\n2\\sum\\limits_{k=1}^N{(\\sum\\limits_{j=1}^M{c_jf_j(x_k)}-y_k)f_1(x_k)}\\\\\r\n\\vdots\\\\\r\n2\\sum\\limits_{k=1}^N{(\\sum\\limits_{j=1}^M{c_jf_j(x_k)}-y_k)f_M(x_k)}\r\n\\end{pmatrix}\\\\\r\n\\frac{\\mathrm{d}E}{\\mathrm{d}C} = 0 \\rightarrow \\begin{pmatrix}\r\n\\sum\\limits_{j=1}^M{(\\sum\\limits_{k=1}^N{f_j(x_k)}f_1(x_k))c_j}\\\\\r\n\\vdots\\\\\r\n\\sum\\limits_{j=1}^M{(\\sum\\limits_{k=1}^N{f_j(x_k)}f_M(x_k))c_j}\r\n\\end{pmatrix} = \r\n\\begin{pmatrix}\r\n\\sum\\limits_{k=1}^N{y_kf_1(x_k)}\\\\\r\n\\vdots\\\\\r\n\\sum\\limits_{k=1}^N{y_kf_M(x_k)}\r\n\\end{pmatrix}\\\\\r\n\\rightarrow F^TFC=F^TY\\\\\r\nF=\\begin{pmatrix}\r\nf_1(x_1) & f_2(x_1) & \\cdots & f_M(x_1)\\\\\r\nf_1(x_2) & f_2(x_2) & \\cdots & f_M(x_2)\\\\\r\n\\vdots & \\vdots & \\vdots & \\vdots\\\\\r\nf_1(x_N) & f_2(x_N) & \\cdots & f_M(x_N)\\\\\r\n\\end{pmatrix},\r\nC=\\begin{pmatrix}\r\nc_1\\\\\r\nc_2\\\\\r\n\\vdots\\\\\r\nc_M\\\\\r\n\\end{pmatrix},\r\nY=\\begin{pmatrix}\r\ny_1\\\\\r\ny_2\\\\\r\n\\vdots\\\\\r\ny_N\\\\\r\n\\end{pmatrix}\r\n$$\r\n\r\n');
INSERT INTO `knowledge` VALUES ('54', '12', '样条函数插值', 'Definition 三次样条函数：设$(x_k,y_k),k=0,1,\\cdots,N$，其中$a = x_0 < x_1 < \\cdots < x_N = b$，若存在$N$个三次多项式$S_k(x)$满足\r\n\r\n$$\r\nS_k(x) = s_{k,0} + s_{k,1}(x-x_k) + s_{k,2}(x-x_k)^2 + s_{k,3}(x-x_k)^3\\\\\r\nS_k(x_k) = y_k\\\\\r\nS_k(x_{k+1}) = S_{k+1}(x_{k+1})\\\\\r\nS\'_k(x_{k+1}) = S\'_{k+1}(x_{k+1})\\\\\r\nS\'\'_k(x_{k+1}) = S\'\'_{k+1}(x_{k+1})\\\\\r\n$$\r\n\r\n于是，$S\'\'(x)$是**分段线性**的，根据拉格朗日插值：\r\n\r\n$$\r\nS_k\'\'(x) = S\'\'(x_k)\\frac{x-x_{k+1}}{x_k-x_{k+1}} + S\'\'(x_{k+1})\\frac{x-x_{k}}{x_{k+1}-x_{k}}\\\\\r\nS\'\'(x_k) = m_k,S\'\'(x_{k+1})=m_{k+1},x_{k+1}-x_k = h_k\\\\\r\n$$\r\n\r\n于是有：\r\n\r\n$$\r\nS_k\'\'(x) = \\frac{m_k}{h_k}(x_{k+1}-x) + \\frac{m_{k+1}}{h_k}(x-x_{k})\\\\\r\n$$\r\n\r\n其中$m_k,m_{k+1}$为未知量。对$S_k\'\'(x)$进行积分，有：\r\n\r\n$$\r\nS_k(x) = \\frac{m_k}{6h_k}(x_{k+1}-x)^3 + \\frac{m_{k+1}}{6h_k}(x-x_{k})^3 + p_k(x_{k+1}-x) + q_k(x-x_k)\\\\\r\nS_k\'(x) = -\\frac{m_k}{2h_k}(x_{k+1}-x)^2 + \\frac{m_{k+1}}{2h_k}(x-x_{k})^2 - p_k + q_k\\\\\r\n$$\r\n\r\n根据三次样条函数满足的条件，有：\r\n\r\n$$\r\nS_k(x_k) = y_k,S_{k+1}(x_{k+1})=S_{k}(x_{k+1})=y_{k+1}\\\\\r\n\\rightarrow y_k = \\frac{m_k}{6}h_k^2 + p_kh_k,y_{k+1} = \\frac{m_{k+1}}{6}h_k^2 + q_kh_k\\\\\r\nS_k\'(x_{k+1}) = S_{k+1}\'(x_{k+1})\\\\\r\n\\rightarrow \\frac{m_{k+1}h_k}{2} - p_k + q_k = -\\frac{m_{k+1}h_{k+1}}{2} - p_{k+1} + q_{k+1}\\\\\r\n$$\r\n\r\n综上，即可得到未知量$m_k,m_{k+1},m_{k+2},k=0,\\cdots,N-2$之间的线性关系. 总共有$N-1$条线性约束，但有$N+1$个变量$m_k$，因此，需要增加端点约束. 端点约束有多种，例如紧压样条，固定端点处的斜率$S_0\'(x_0) = d_0,S_N\'(x_N) = d_N$.\r\n\r\nTheorem 三次样条曲线的适宜性：设$f\\in C^2[a,b]$，$S(x)$是经过$(x_k, f(x_k)),k = 0,1,\\cdots,N$的紧压样条曲线，则\r\n\r\n$$\r\n\\int_a^b(S\'\'(x))^2{\\rm d}x \\leq \\int_a^b(f\'\'(x))^2{\\rm d}x\r\n$$\r\n\r\nProof:\r\n\r\n$$\r\n\\int_a^b{S\'\'(x)(f\'\'(x)-S\'\'(x))}{\\rm d}x\\\\\r\n= [S\'\'(x)(f\'(x)-S\'(x))]_a^b - \\int_a^b{S\'\'\'(x)(f\'(x)-S\'(x))}{\\rm d}x\\\\\r\n= \\int_a^b{6s_{k,3}(f\'(x)-S\'(x))}{\\rm d}x = [6s_{k,3}(f(x)-S(x))]_a^b=0\\\\\r\n\\rightarrow \\int_a^b{S\'\'(x)f\'\'(x)-(S\'\'(x))^2}{\\rm d}x=0\\\\\r\n\\rightarrow \\int_a^b{(S\'\'(x))^2}{\\rm d}x = \\int_a^b{S\'\'(x)f\'\'(x)}{\\rm d}x\\\\\r\n\\rightarrow \\int_a^b{(S\'\'(x)-f\'\'(x))^2}{\\rm d}x =  \\int_a^b{(f\'\'(x))^2}{\\rm d}x - \\int_a^b{(S\'\'(x))^2}{\\rm d}x \\geq 0\r\n$$');

-- ----------------------------
-- Table structure for `knowledge_dependency`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_dependency`;
CREATE TABLE `knowledge_dependency` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `knowledge_id` int NOT NULL,
  `dependent_knowledge_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `knowledge_id` (`knowledge_id`),
  KEY `dependent_knowledge_id` (`dependent_knowledge_id`),
  CONSTRAINT `knowledge_dependency_ibfk_1` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge` (`id`),
  CONSTRAINT `knowledge_dependency_ibfk_2` FOREIGN KEY (`dependent_knowledge_id`) REFERENCES `knowledge` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of knowledge_dependency
-- ----------------------------
INSERT INTO `knowledge_dependency` VALUES ('8', '22', '20');
INSERT INTO `knowledge_dependency` VALUES ('9', '22', '21');
INSERT INTO `knowledge_dependency` VALUES ('10', '23', '20');
INSERT INTO `knowledge_dependency` VALUES ('11', '23', '21');
INSERT INTO `knowledge_dependency` VALUES ('12', '24', '20');
INSERT INTO `knowledge_dependency` VALUES ('25', '36', '35');
INSERT INTO `knowledge_dependency` VALUES ('27', '38', '35');
INSERT INTO `knowledge_dependency` VALUES ('28', '38', '36');
INSERT INTO `knowledge_dependency` VALUES ('29', '38', '37');
INSERT INTO `knowledge_dependency` VALUES ('41', '37', '35');
INSERT INTO `knowledge_dependency` VALUES ('42', '37', '36');
INSERT INTO `knowledge_dependency` VALUES ('43', '45', '41');
INSERT INTO `knowledge_dependency` VALUES ('44', '45', '42');
INSERT INTO `knowledge_dependency` VALUES ('45', '39', '36');
INSERT INTO `knowledge_dependency` VALUES ('46', '42', '41');
INSERT INTO `knowledge_dependency` VALUES ('47', '44', '41');
INSERT INTO `knowledge_dependency` VALUES ('48', '44', '42');
INSERT INTO `knowledge_dependency` VALUES ('49', '40', '35');
INSERT INTO `knowledge_dependency` VALUES ('50', '40', '36');
INSERT INTO `knowledge_dependency` VALUES ('51', '40', '37');
INSERT INTO `knowledge_dependency` VALUES ('52', '40', '38');
INSERT INTO `knowledge_dependency` VALUES ('53', '40', '39');
INSERT INTO `knowledge_dependency` VALUES ('57', '51', '50');
INSERT INTO `knowledge_dependency` VALUES ('59', '54', '52');
INSERT INTO `knowledge_dependency` VALUES ('60', '49', '48');
INSERT INTO `knowledge_dependency` VALUES ('67', '43', '41');
INSERT INTO `knowledge_dependency` VALUES ('68', '43', '42');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `introduction` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('7', 'Java程序设计', 'Java是一种优秀的面向对象的语言，具有跨平台性、用途广泛、容易学习等特点，众多的开源项目都是用Java实现的，可以说Java是程序设计必学的语言。这门课程掌握Java语言、面向对象的特点，掌握Java在多线程、图形用户界面、网络等方面的应用，同时要养成良好的编程习惯，能够编写有一定规模的应用程序。 ');
INSERT INTO `subject` VALUES ('9', '数据结构', '本课程介绍基本数据结构以及相关的经典算法，强调问题-数据-算法的抽象过程，关注数据结构与算法的时间空间效率，培养学生编写出高效程序从而解决实际问题的综合能力。');
INSERT INTO `subject` VALUES ('12', '数值方法', '主要介绍求解不动点问题$x = g(x)$、定位根、求解线性方程组$AX=B$、插值、逼近、最小二乘、样条函数插值等数值方法。');

-- ----------------------------
-- Table structure for `subject_map`
-- ----------------------------
DROP TABLE IF EXISTS `subject_map`;
CREATE TABLE `subject_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `student_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_email` (`student_email`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_email` (`teacher_email`),
  CONSTRAINT `subject_map_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `subject_map_ibfk_2` FOREIGN KEY (`teacher_email`) REFERENCES `user` (`email`),
  CONSTRAINT `subject_map_ibfk_3` FOREIGN KEY (`student_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of subject_map
-- ----------------------------
INSERT INTO `subject_map` VALUES ('1', 'teacher1@cug.edu.cn', 'student1@cug.edu.cn', '7');
INSERT INTO `subject_map` VALUES ('2', 'teacher1@cug.edu.cn', 'student1@cug.edu.cn', '9');
INSERT INTO `subject_map` VALUES ('4', 'teacher1@cug.edu.cn', 'student2@cug.edu.cn', '7');
INSERT INTO `subject_map` VALUES ('5', 'teacher1@cug.edu.cn', 'student2@cug.edu.cn', '12');
INSERT INTO `subject_map` VALUES ('7', 'teacher1@cug.edu.cn', 'student2@cug.edu.cn', '9');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `class` varchar(20),
  `usertype` tinyint NOT NULL,
  `university` varchar(20) DEFAULT NULL,
  `institution_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`,`usertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('jiaxinliang@cug.edu.cn', 'e10adc3949ba59abbe56e057f20f883e', '梁家欣', null, '0', '中国地质大学', '20191000308');
INSERT INTO `user` VALUES ('student1@cug.edu.cn', 'e10adc3949ba59abbe56e057f20f883e', '学生1', '19001', '1', '中国地质大学', '20190000001');
INSERT INTO `user` VALUES ('student2@cug.edu.cn', 'e10adc3949ba59abbe56e057f20f883e', '学生2', '19001', '1', '中国地质大学', '20190000002');
INSERT INTO `user` VALUES ('teacher1@cug.edu.cn', 'e10adc3949ba59abbe56e057f20f883e', '老师A', null, '2', '中国地质大学', '666666');
DROP TRIGGER IF EXISTS `judge`;
DELIMITER ;;
CREATE TRIGGER `judge` BEFORE INSERT ON `answer` FOR EACH ROW BEGIN
    DECLARE right_answer TEXT;
    DECLARE exercise_type INT;
    SELECT answer, type INTO right_answer, exercise_type FROM exercise WHERE exercise.id=NEW.exercise_id;
    IF ISNULL(right_answer) != 1 AND LENGTH(TRIM(right_answer)) != 0 THEN
        IF exercise_type = 1 OR exercise_type = 2 THEN
            IF right_answer = NEW.answer THEN
                SET NEW.is_right = 100;
            ELSE
                SET NEW.is_right = 0;
            END IF;
        END IF;
    END IF;
    IF exercise_type = 5 THEN
        INSERT INTO source_code(source) values(NEW.answer);
        SET NEW.solution_id = LAST_INSERT_ID();
        INSERT INTO solution(solution_id, problem_id, user_id, nick, in_date, language, ip, contest_id, valid, num)
        VALUES(NEW.solution_id, NEW.exercise_id, 'admin', 'jiaxinliang', NEW.create_time, NEW.language, '127.0.0.1', '0', '1', '-1');
    END IF;
END
;;
DROP TRIGGER IF EXISTS `oj`;
DELIMITER ;;
CREATE TRIGGER `oj` AFTER UPDATE ON `solution` FOR EACH ROW BEGIN
    IF NEW.result >= 4 THEN
        IF NEW.result = 4 THEN
            UPDATE answer SET is_right = 100, result = NEW.result WHERE solution_id = NEW.solution_id;
        ELSE
            UPDATE answer SET is_right = 0, result = NEW.result WHERE solution_id = NEW.solution_id;
        END IF ;
    END IF ;
END
;;
SET FOREIGN_KEY_CHECKS=1;
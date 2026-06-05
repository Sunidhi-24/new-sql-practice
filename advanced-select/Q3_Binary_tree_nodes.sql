/*
Problem: Binary Tree Nodes

Task:
Classify each node as:
- Root  : Parent is NULL
- Leaf  : Node has no children
- Inner : Node has at least one child and is not root

Note:
- P IS NULL identifies the root node.
- N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL)
  identifies leaf nodes because they are never parents.
- Remaining nodes are inner nodes.
*/

SELECT N,
CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N NOT IN (
        SELECT P
        FROM BST
        WHERE P IS NOT NULL
    ) THEN 'Leaf'
    ELSE 'Inner'
END
FROM BST
ORDER BY N;

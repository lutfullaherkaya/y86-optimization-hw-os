#include <stdio.h>

struct btree {
    long value;
    struct btree *left, *right;
};

/* NOTE: (void *) 0 is how NULL is defined in C.
   Basically, NULL should correspond to zero in your
   y86-64 code, nothing confusing! */

/* Find the the maximum value in a BST containing only positive values.
 * (binary search tree), return 0 if the tree is empty. */
long max_bst(const struct btree *root)
{
    long max = 0; /* Zero initially, in case the tree is empty. */
    if (root) { /* In case the root is not null... */
        /* Go right until you cannot anymore to find the max. */
        while (root->right)
            root = root->right;
        max = root->value; /* The value of the last node is the max. */
    }
    return max; /* Return the maximum */
}

/* Find the maximum of an ARBITRARY binary tree. Simple recursion!
 * Return LONG_MIN (-2^63) if the tree is empty. */
long max_btree(const struct btree *root)
{
    long max = 1L << 63; /* A trick, since the min is 100000..0 in binary */
    if (root) {
       long candidate;

       max = root->value; /* Start by assuming current value is the max */
       
       /* Update with left max if larger */
       candidate = max_btree(root->left);
       if (candidate > max)
           max = candidate;

       /* Do the same with the right max */
       candidate = max_btree(root->right);
       if (candidate > max)
           max = candidate;
       
    }
   return max; /* Return the final maximum */
}

/* Place elements of a binary tree in-order into an output array.  Return the
 * amount of elements placed in the array. ... And place at most array_len
 * elements to prevent overflows! */
long collect_into(const struct btree *root, long *array, long array_len)
{
    if (!root || array_len <= 0) { /* No slots available, or the tree is empty! */
        return 0;
    } else {
        long left_len, right_len; /* Counts for number of elements collected from subtrees. */
        
        left_len = collect_into(root->left, array, array_len); /* Collec the left subtree. */

        if (left_len == array_len) /* Array filled, can't collect anything else, just return. */
            return left_len;

        /* If we got here, there's still space left! */
        
        array[left_len] = root->value; /* Put the current value after the left subtree elements. */

        /* Now, collect the right subtree's elements, carefully starting from remaining 
         * slots in the array. */
        right_len = collect_into(root->right, array + left_len + 1, array_len - left_len - 1);
        
        /* Finally, return the amount of elements accumulated. */
        return left_len + 1 + right_len;
    }
}

int main() {
    long arr[8];
    struct btree root, node6, node4, node3, node5, node11, node8, node24, node19, node40, node52;
    root.value = 17;
    root.left = &node6;
    root.right = &node24;

    node6.value = 6;
    node6.left = &node4;
    node6.right = &node11;

    node4.value = 4;
    node4.left = &node3;
    node4.right = &node5;

    node3.value = 3;
    node3.left = NULL;
    node3.right = NULL;

    node5.value = 5;
    node5.left = NULL;
    node5.right = NULL;

    node11.value = 11;
    node11.left = &node8;
    node11.right = NULL;

    node8.value = 8;
    node8.left = NULL;
    node8.right = NULL;

    node24.value = 24;
    node24.left = &node19;
    node24.right = &node40;

    node19.value = 19;
    node19.left = NULL;
    node19.right = NULL;

    node40.value = 40;
    node40.left = NULL;
    node40.right = &node52;

    node52.value = 52;
    node52.left = NULL;
    node52.right = NULL;

    collect_into (&root, arr, 8);
    for (int i = 0; i < 8; ++i) {
        printf("%lx ", arr[i]);
    }
    return 0;
}
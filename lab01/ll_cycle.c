#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* your code here */
    if (head == NULL) return 0;
    node *tortoise = head;
    node *hare = head;

    while (hare && hare->next) {
        tortoise = tortoise->next;
        hare = hare->next->next;
        if (hare == tortoise) {
            return 1;
        }
    }
    return 0;
}
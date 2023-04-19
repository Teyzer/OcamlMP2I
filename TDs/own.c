#include <stdlib.h>
#include <stdio.h>

void join(int* tab, int debut, int milieu, int fin) {

    int* temp = (int*)malloc(sizeof(int) * (fin - debut + 1));
    
    int i1 = debut;
    int i2 = milieu + 1;
    int i = 0;

    while (i1 <= milieu && i2 <= fin) {
        if (tab[i1] <= tab[i2]) {
            temp[i] = tab[i1];
            i1 = i1 + 1;
        } else {
            temp[i] = tab[i2];
            i2 = i2 + 1;
        }
        i = i + 1;
    }

    while (i1 <= milieu) {
        temp[i] = tab[i1];
        i1 = i1 + 1;
        i = i + 1;
    }

    while (i2 <= fin) {
        temp[i] = tab[i2];
        i2 = i2 + 1;
        i = i + 1;
    }

    for (int k = 0; k < fin - debut + 1; k++) {
        tab[k + debut] = temp[k];
    }

    free(temp);

}

void tri_fusion(int* tab, int debut, int fin) {
    if (debut >= fin) return;
    int milieu = (debut + fin) / 2;
    tri_fusion(tab, debut, milieu);
    tri_fusion(tab, milieu + 1, fin);
    join(tab, debut, milieu, fin);
}

void print(int* tab, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d, ", tab[i]);
    }
    printf("\n");
}

int main() {
    int* a = (int*)malloc(sizeof(int) * 16);
    a[0] = 2;
    a[1] = 8;
    a[2] = 5;
    a[3] = 997;
    a[4] = 98;
    a[5] = 18;

    print(a, 6);

    tri_fusion(a, 0, 5);
    print(a, 6);
}
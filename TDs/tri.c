#include <stdlib.h>
#include <stdio.h>

// invariant: res[0..i-1] est une permutation triée de tab[debut..i1 - 1] union tab[milieu + 1..i2 - 1]
// pour tout k dans [[i; milieu]] union [[i2; fin]], res[i - 1] =< tab[k]

void fusion(int* tab, int debut, int milieu, int fin) {

    int* res = (int*)malloc(sizeof(int) * (fin - debut + 1));
    int i1 = debut;
    int i2 = milieu + 1;
    int i = 0;

    while (i1 <= milieu && i2 <= fin) {
        if (tab[i1] <= tab[i2]) {
            res[i] = tab[i1];
            i1 = i1 + 1;
            i = i + 1;
        } else {
            res[i] = tab[i2];
            i2 = i2 + 1;
            i = i + 1;
        }
    }

    while (i1 <= milieu) {
        res[i] = tab[i1];
        i1 = i1 + 1;
        i = i + 1;
    }

    while (i2 <= fin) {
        res[i] = tab[i2];
        i2 = i2 + 1;
        i = i + 1;
    }

    for (int k = 0; k < fin - debut + 1; k++) {
        tab[k + debut] = res[k];
    }

    free(res);

}

void tri_fusion(int* tab, int debut, int fin) {
    if (debut >= fin) return;
    int milieu = (debut + fin) / 2;
    tri_fusion(tab, debut, milieu);
    tri_fusion(tab, milieu+1, fin);
    fusion(tab, debut, milieu, fin);
}

void tri_iteratif(int* tab, int size) {

    for (int subsize = 1; subsize < size; subsize *= 2) {

        for (int i = 0; i < size / subsize; i++) {
            fusion(tab, i * subsize, i * subsize + subsize / 2, i * (subsize + 1));
        }

    }

}

void print(int* tab, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d, ", tab[i]);
    }
    printf("\n");
}

int main() {
    int* a = (int*)malloc(sizeof(int) * 5);
    scanf("%d", a + 0);
    scanf("%d", a + 1);
    scanf("%d", a + 2);
    scanf("%d", a + 3);
    scanf("%d", a + 4);

    print(a, 5);

    tri_iteratif(a, 5);
    print(a, 5);
}
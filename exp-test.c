#include <stdio.h>
#include <math.h>

#include "common.h"

int main ( void ) {
	int i;

	for(i=0;i<=10;i++)
	  printf("%d %lf %lf\n", i, my_power( 0.5, i ), pow( 0.5, i ));

}

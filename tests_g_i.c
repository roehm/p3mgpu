#include <stdio.h>

#include "types.h"
#include "p3m-common.h"

#include "p3m-ik.h"
#include "p3m-ik-i.h"

#include "p3m-ad.h"
#include "p3m-ad-i.h"

#include "io.h"

int main(void) {
  system_t *s = NULL;
  parameters_t p;
  data_t *d_ik, *d_ik_i, *d_ad, *d_ad_i;
  int i, err=0;
  FLOAT_TYPE alpha;

  s = Daten_einlesen( &p, "tests-wall.pos");

  d_ik = method_p3m_ik.Init( s, &p );
  d_ik_i = method_p3m_ik_i.Init( s, &p );

  d_ad = method_p3m_ad.Init( s, &p );
  d_ad_i = method_p3m_ad_i.Init( s, &p );

  for(alpha=0.0;alpha<100.0;alpha+=0.1) { 
    p.alpha = alpha;

    method_p3m_ik.Influence_function( s, &p, d_ik );
    method_p3m_ik_i.Influence_function( s, &p, d_ik_i );
  
    method_p3m_ad.Influence_function( s, &p, d_ad );
    method_p3m_ad_i.Influence_function( s, &p, d_ad_i );

    for(i=0;i<(p.mesh*p.mesh*p.mesh); i++) {
      if( ( d_ik->G_hat[i] - d_ik_i->G_hat[i] ) > 10e-10 ) 
	printf( "err nr: %d ik %d %e %e\n", ++err, i, d_ik->G_hat[i], d_ik_i->G_hat[i]);

      if( ( d_ad->G_hat[i] - d_ad_i->G_hat[i] ) > 10e-10 )
	printf( "err nr: %d ad %d %e %e\n", ++err, i, d_ad->G_hat[i], d_ad_i->G_hat[i]);
    }
  }
  
  printf("Finished with %d errors.\n", err);
    
  return 0;
}

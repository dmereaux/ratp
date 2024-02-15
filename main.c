
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmocka.h"
#include <string.h>
#include "ratp.h"


/* A test case that does nothing and succeeds. */


void recupAge(int* age)
{
    *age=(int)mock();
}
static int setup(void **state) {
    (void) state;
    printf("setUp");
 return 0;
}
static int teardown(void **state) {
    (void) state;
    printf("tearDown");
     return 0;
}
static void Test_pas_tourist_et_adulte(void **state) {
    (void) state; 
    float prix;
    will_return(recupAge,12);
    prix= computePrice(20.0,0);
    assert_float_equal(1.5,prix,0.001);

}


int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test_setup(Test_pas_tourist_et_adulte,setup),
        
    };
 //   cmocka_set_message_output(CM_OUTPUT_XML);
    return cmocka_run_group_tests_name("toto",tests, setup, teardown);
}

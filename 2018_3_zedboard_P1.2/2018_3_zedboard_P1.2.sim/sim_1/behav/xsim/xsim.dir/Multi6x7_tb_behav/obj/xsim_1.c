/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_501(char*, char *);
extern void execute_500(char*, char *);
extern void execute_16(char*, char *);
extern void execute_86(char*, char *);
extern void execute_155(char*, char *);
extern void execute_224(char*, char *);
extern void execute_293(char*, char *);
extern void execute_362(char*, char *);
extern void execute_431(char*, char *);
extern void execute_446(char*, char *);
extern void execute_458(char*, char *);
extern void execute_470(char*, char *);
extern void execute_482(char*, char *);
extern void execute_495(char*, char *);
extern void execute_496(char*, char *);
extern void execute_14(char*, char *);
extern void execute_15(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[18] = {(funcp)execute_501, (funcp)execute_500, (funcp)execute_16, (funcp)execute_86, (funcp)execute_155, (funcp)execute_224, (funcp)execute_293, (funcp)execute_362, (funcp)execute_431, (funcp)execute_446, (funcp)execute_458, (funcp)execute_470, (funcp)execute_482, (funcp)execute_495, (funcp)execute_496, (funcp)execute_14, (funcp)execute_15, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 18;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Multi6x7_tb_behav/xsim.reloc",  (void **)funcTab, 18);
	iki_vhdl_file_variable_register(dp + 9696);
	iki_vhdl_file_variable_register(dp + 9752);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Multi6x7_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Multi6x7_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Multi6x7_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Multi6x7_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Multi6x7_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}

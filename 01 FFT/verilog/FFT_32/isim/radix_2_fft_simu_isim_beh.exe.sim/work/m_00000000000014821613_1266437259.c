/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/projects/GithubRepositories/DigitalElectronics/01 FFT/verilog/FFT_32/test_FFT_32.v";
static unsigned int ng1[] = {40U, 0U};
static unsigned int ng2[] = {24U, 0U};
static unsigned int ng3[] = {232U, 0U};
static unsigned int ng4[] = {216U, 0U};



static void Initial_63_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 2224U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);

LAB4:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1424);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1516);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1700);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2124);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 1424);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1516);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1700);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB1;

}


extern void work_m_00000000000014821613_1266437259_init()
{
	static char *pe[] = {(void *)Initial_63_0};
	xsi_register_didat("work_m_00000000000014821613_1266437259", "isim/radix_2_fft_simu_isim_beh.exe.sim/work/m_00000000000014821613_1266437259.didat");
	xsi_register_executes(pe);
}

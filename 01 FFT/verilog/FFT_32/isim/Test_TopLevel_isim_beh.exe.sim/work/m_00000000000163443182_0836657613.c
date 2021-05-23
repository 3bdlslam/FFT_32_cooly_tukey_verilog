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
static const char *ng0 = "clk:%b flag:%b \ninput:\n %h \n %h \n output:\n %h \n %h";
static int ng1[] = {0, 0};
static const char *ng2 = "D:/projects/GithubRepositories/DigitalElectronics/01 FFT/verilog/FFT_32/Test_TopLevel.v";
static int ng3[] = {1, 0};

void Monitor_52_3(char *);
void Monitor_52_3(char *);


static void Monitor_52_3_Func(char *t0)
{
    char t12[64];
    char t26[64];
    char t40[64];
    char t54[64];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;

LAB0:    t1 = (t0 + 736);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = (t0 + 3316);
    t5 = *((char **)t4);
    t6 = ((((char*)(t5))) + 36U);
    t7 = *((char **)t6);
    t8 = (t0 + 3336);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 36U);
    t11 = *((char **)t10);
    t13 = (t0 + 3356);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 44U);
    t16 = *((char **)t15);
    t17 = (t0 + 3376);
    t18 = *((char **)t17);
    t19 = ((((char*)(t18))) + 40U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t12, 256, t11, t16, t20, 2, 1, t21, 32, 1);
    t22 = (t0 + 3396);
    t23 = *((char **)t22);
    t24 = ((((char*)(t23))) + 36U);
    t25 = *((char **)t24);
    t27 = (t0 + 3416);
    t28 = *((char **)t27);
    t29 = ((((char*)(t28))) + 44U);
    t30 = *((char **)t29);
    t31 = (t0 + 3436);
    t32 = *((char **)t31);
    t33 = ((((char*)(t32))) + 40U);
    t34 = *((char **)t33);
    t35 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t26, 256, t25, t30, t34, 2, 1, t35, 32, 1);
    t36 = (t0 + 3456);
    t37 = *((char **)t36);
    t38 = ((((char*)(t37))) + 36U);
    t39 = *((char **)t38);
    t41 = (t0 + 3476);
    t42 = *((char **)t41);
    t43 = ((((char*)(t42))) + 44U);
    t44 = *((char **)t43);
    t45 = (t0 + 3496);
    t46 = *((char **)t45);
    t47 = ((((char*)(t46))) + 40U);
    t48 = *((char **)t47);
    t49 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t40, 256, t39, t44, t48, 2, 1, t49, 32, 1);
    t50 = (t0 + 3516);
    t51 = *((char **)t50);
    t52 = ((((char*)(t51))) + 36U);
    t53 = *((char **)t52);
    t55 = (t0 + 3536);
    t56 = *((char **)t55);
    t57 = ((((char*)(t56))) + 44U);
    t58 = *((char **)t57);
    t59 = (t0 + 3556);
    t60 = *((char **)t59);
    t61 = ((((char*)(t60))) + 40U);
    t62 = *((char **)t61);
    t63 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t54, 256, t53, t58, t62, 2, 1, t63, 32, 1);
    xsi_vlogfile_write(1, 0, 3, ng0, 7, t0, (char)118, t3, 1, (char)118, t7, 1, (char)118, t12, 256, (char)118, t26, 256, (char)118, t40, 256, (char)118, t54, 256);

LAB1:    return;
}

static void Initial_13_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(13, ng2);

LAB4:    xsi_set_current_line(16, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(16, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(17, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(17, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(18, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(18, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(19, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(19, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(20, ng2);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 828);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(21, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(21, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(22, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(22, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(23, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(23, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(24, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(24, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(25, ng2);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 828);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(26, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(26, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(27, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(27, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(28, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(28, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(29, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(29, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(30, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    xsi_set_current_line(30, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(31, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    xsi_set_current_line(31, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(32, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    xsi_set_current_line(32, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(33, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB20:    xsi_set_current_line(33, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(34, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB21:    xsi_set_current_line(34, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(35, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB22:    xsi_set_current_line(35, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(37, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB23:    xsi_set_current_line(37, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(38, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB24:    xsi_set_current_line(38, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(39, ng2);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 828);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(40, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB25:    xsi_set_current_line(40, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(41, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB26:    xsi_set_current_line(41, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(43, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    xsi_set_current_line(43, ng2);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(44, ng2);
    t2 = (t0 + 1252);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB28:    xsi_set_current_line(44, ng2);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 736);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    goto LAB1;

}

static void Always_50_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 1496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng2);

LAB4:    xsi_set_current_line(50, ng2);
    t2 = (t0 + 1396);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(50, ng2);
    t4 = (t0 + 736);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t7) == 0)
        goto LAB6;

LAB8:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB9:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB10:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 736);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

LAB11:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB10;

}

static void Always_51_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 1640U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng2);
    t2 = (t0 + 1980);
    *((int *)t2) = 1;
    t3 = (t0 + 1668);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(52, ng2);
    Monitor_52_3(t0);
    goto LAB2;

}

void Monitor_52_3(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 1684);
    t2 = (t0 + 1988);
    xsi_vlogfile_monitor((void *)Monitor_52_3_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000000163443182_0836657613_init()
{
	static char *pe[] = {(void *)Initial_13_0,(void *)Always_50_1,(void *)Always_51_2,(void *)Monitor_52_3};
	xsi_register_didat("work_m_00000000000163443182_0836657613", "isim/Test_TopLevel_isim_beh.exe.sim/work/m_00000000000163443182_0836657613.didat");
	xsi_register_executes(pe);
}

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
static const char *ng0 = "real=%h  imag=%h";
static const char *ng1 = "D:/projects/GithubRepositories/DigitalElectronics/01 FFT/verilog/FFT_32/test_FFT_32.v";
static unsigned int ng2[] = {4144362249U, 0U, 4227528703U, 0U, 4143385601U, 0U, 167841528U, 0U, 234620921U, 0U, 233965043U, 0U, 166788597U, 0U, 84741112U, 0U};
static unsigned int ng3[] = {4193845504U, 0U, 4245289215U, 0U, 4077914612U, 0U, 66194172U, 0U, 34079504U, 0U, 4076663305U, 0U, 4212192756U, 0U, 4245027572U, 0U};
static unsigned int ng4[] = {4210556919U, 0U, 101711619U, 0U, 100729345U, 0U, 4210624514U, 0U, 133498890U, 0U, 117181444U, 0U, 118028540U, 0U, 4211213836U, 0U};
static unsigned int ng5[] = {4278842377U, 0U, 4043504388U, 0U, 284228102U, 0U, 4262267662U, 0U, 4126929933U, 0U, 4211865087U, 0U, 117176056U, 0U, 200406006U, 0U};
static unsigned int ng6[] = {50721022U, 0U, 4262133256U, 0U, 4143968782U, 0U, 4144762873U, 0U, 4261738755U, 0U, 218756618U, 0U, 184553483U, 0U, 251593469U, 0U};
static unsigned int ng7[] = {4194106353U, 0U, 133386U, 0U, 4127917317U, 0U, 4227527426U, 0U, 235011065U, 0U, 100400378U, 0U, 4128179963U, 0U, 267456754U, 0U};
static unsigned int ng8[] = {284226316U, 0U, 4059689968U, 0U, 4245619956U, 0U, 4111004686U, 0U, 117113849U, 0U, 783876U, 0U, 4076932347U, 0U, 66717955U, 0U};
static unsigned int ng9[] = {84542196U, 0U, 200869371U, 0U, 66711554U, 0U, 4211732491U, 0U, 4278585845U, 0U, 4244898317U, 0U, 33882376U, 0U, 4160622338U, 0U};
static unsigned int ng10[] = {4244372237U, 0U, 4294773246U, 0U, 268436474U, 0U, 4178379774U, 0U, 235667957U, 0U, 133493246U, 0U, 4042321921U, 0U, 101122565U, 0U};
static unsigned int ng11[] = {184611084U, 0U, 4144099856U, 0U, 4092727025U, 0U, 4193586179U, 0U, 4176873978U, 0U, 4076472306U, 0U, 167309840U, 0U, 4211142916U, 0U};
static unsigned int ng12[] = {83555087U, 0U, 118230028U, 0U, 4210953488U, 0U, 284819442U, 0U, 4144233983U, 0U, 133172464U, 0U, 51383038U, 0U, 4044293630U, 0U};
static unsigned int ng13[] = {251260941U, 0U, 84675855U, 0U, 4210296843U, 0U, 133565939U, 0U, 166785293U, 0U, 4210556921U, 0U, 269355253U, 0U, 150801934U, 0U};
static unsigned int ng14[] = {4245618183U, 0U, 250937328U, 0U, 151581439U, 0U, 33624056U, 0U, 219084537U, 0U, 50590198U, 0U, 166725635U, 0U, 32506370U, 0U};
static unsigned int ng15[] = {4227267833U, 0U, 67239180U, 0U, 34403580U, 0U, 183700722U, 0U, 4294506234U, 0U, 4044165131U, 0U, 83097589U, 0U, 4210755850U, 0U};
static unsigned int ng16[] = {50196485U, 0U, 4061000455U, 0U, 4211539214U, 0U, 33027573U, 0U, 84670461U, 0U, 269286410U, 0U, 83819022U, 0U, 4177984518U, 0U};
static unsigned int ng17[] = {101125113U, 0U, 168690428U, 0U, 33292045U, 0U, 235802374U, 0U, 4059237120U, 0U, 4077450228U, 0U, 4161539058U, 0U, 217255164U, 0U};
static unsigned int ng18[] = {269545719U, 0U, 4076598286U, 0U, 235277560U, 0U, 33886454U, 0U, 4178576127U, 0U, 4027123953U, 0U, 252704504U, 0U, 219087375U, 0U};
static unsigned int ng19[] = {4211478257U, 0U, 150272512U, 0U, 134611472U, 0U, 4212130574U, 0U, 268045577U, 0U, 4277599735U, 0U, 4177988097U, 0U, 101447682U, 0U};
static unsigned int ng20[] = {251132684U, 0U, 4044293903U, 0U, 218038268U, 0U, 4176940016U, 0U, 16647685U, 0U, 150730755U, 0U, 4227728653U, 0U, 4060481527U, 0U};
static unsigned int ng21[] = {4210881777U, 0U, 4160750072U, 0U, 4060676084U, 0U, 151846412U, 0U, 185136139U, 0U, 4059558399U, 0U, 4261348596U, 0U, 4227076087U, 0U};

void Monitor_76_2(char *);
void Monitor_76_2(char *);


static void Monitor_76_2_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 600U);
    t2 = *((char **)t1);
    t1 = (t0 + 692U);
    t3 = *((char **)t1);
    xsi_vlogfile_write(1, 0, 3, ng0, 3, t0, (char)118, t2, 256, (char)118, t3, 256);

LAB1:    return;
}

static void Initial_21_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(21, ng1);

LAB4:    xsi_set_current_line(24, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(25, ng1);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(26, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(29, ng1);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(30, ng1);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(31, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(34, ng1);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(35, ng1);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(36, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(39, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(40, ng1);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(41, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(44, ng1);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(45, ng1);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(46, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(49, ng1);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(50, ng1);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(51, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(54, ng1);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(55, ng1);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(56, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(59, ng1);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(60, ng1);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(61, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(64, ng1);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(65, ng1);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(66, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(69, ng1);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(70, ng1);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 1012);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 256, 0LL);
    xsi_set_current_line(71, ng1);
    t2 = (t0 + 1528);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    goto LAB1;

}

static void Always_75_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 1772U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(75, ng1);
    t2 = (t0 + 2112);
    *((int *)t2) = 1;
    t3 = (t0 + 1800);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(76, ng1);
    Monitor_76_2(t0);
    goto LAB2;

}

void Monitor_76_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 1816);
    t2 = (t0 + 2120);
    xsi_vlogfile_monitor((void *)Monitor_76_2_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000001980040575_2134643061_init()
{
	static char *pe[] = {(void *)Initial_21_0,(void *)Always_75_1,(void *)Monitor_76_2};
	xsi_register_didat("work_m_00000000001980040575_2134643061", "isim/test_FFT_32_isim_beh.exe.sim/work/m_00000000001980040575_2134643061.didat");
	xsi_register_executes(pe);
}

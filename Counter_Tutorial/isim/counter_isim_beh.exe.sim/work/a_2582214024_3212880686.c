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

/* This file is designed for use with ISim build 0x79f3f3a8 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Counter_Tutorial/counter.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2582214024_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    char *t11;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;

LAB0:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 948U);
    t2 = *((char **)t1);
    t8 = (0 - 2);
    t33 = (t8 * -1);
    t34 = (1U * t33);
    t35 = (0 + t34);
    t1 = (t2 + t35);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 1744);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_delta(t5, 2U, 1, 0LL);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 948U);
    t2 = *((char **)t1);
    t8 = (1 - 2);
    t33 = (t8 * -1);
    t34 = (1U * t33);
    t35 = (0 + t34);
    t1 = (t2 + t35);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 1744);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_delta(t5, 1U, 1, 0LL);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 948U);
    t2 = *((char **)t1);
    t8 = (2 - 2);
    t33 = (t8 * -1);
    t34 = (1U * t33);
    t35 = (0 + t34);
    t1 = (t2 + t35);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 1744);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 40U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_delta(t5, 0U, 1, 0LL);
    t1 = (t0 + 1700);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 2889);
    t6 = (t0 + 948U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 3U);
    goto LAB3;

LAB5:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 948U);
    t5 = *((char **)t2);
    t2 = (t0 + 2892);
    t8 = xsi_mem_cmp(t2, t5, 3U);
    if (t8 == 1)
        goto LAB8;

LAB17:    t7 = (t0 + 2895);
    t10 = xsi_mem_cmp(t7, t5, 3U);
    if (t10 == 1)
        goto LAB9;

LAB18:    t11 = (t0 + 2898);
    t13 = xsi_mem_cmp(t11, t5, 3U);
    if (t13 == 1)
        goto LAB10;

LAB19:    t14 = (t0 + 2901);
    t16 = xsi_mem_cmp(t14, t5, 3U);
    if (t16 == 1)
        goto LAB11;

LAB20:    t17 = (t0 + 2904);
    t19 = xsi_mem_cmp(t17, t5, 3U);
    if (t19 == 1)
        goto LAB12;

LAB21:    t20 = (t0 + 2907);
    t22 = xsi_mem_cmp(t20, t5, 3U);
    if (t22 == 1)
        goto LAB13;

LAB22:    t23 = (t0 + 2910);
    t25 = xsi_mem_cmp(t23, t5, 3U);
    if (t25 == 1)
        goto LAB14;

LAB23:    t26 = (t0 + 2913);
    t28 = xsi_mem_cmp(t26, t5, 3U);
    if (t28 == 1)
        goto LAB15;

LAB24:
LAB16:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 2940);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);

LAB7:    goto LAB3;

LAB8:    xsi_set_current_line(34, ng0);
    t29 = (t0 + 2916);
    t31 = (t0 + 948U);
    t32 = *((char **)t31);
    t31 = (t32 + 0);
    memcpy(t31, t29, 3U);
    goto LAB7;

LAB9:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 2919);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB10:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 2922);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB11:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2925);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB12:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 2928);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB13:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 2931);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB14:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2934);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB15:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2937);
    t5 = (t0 + 948U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 3U);
    goto LAB7;

LAB25:;
}


extern void work_a_2582214024_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2582214024_3212880686_p_0};
	xsi_register_didat("work_a_2582214024_3212880686", "isim/counter_isim_beh.exe.sim/work/a_2582214024_3212880686.didat");
	xsi_register_executes(pe);
}

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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *UNISIM_P_0947159679;
char *VL_P_2533777724;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_13701390776532775226_2297623829_init();
    unisims_ver_m_03665957290517102759_2282143210_init();
    unisims_ver_m_06158891332638045337_3897995058_init();
    unisims_ver_m_06158891332638045337_1625843133_init();
    unisims_ver_m_11740342327072834795_0225263307_init();
    unisims_ver_m_17544706326343019120_2845851632_init();
    unisims_ver_m_02760857255181855774_2593380106_init();
    work_m_15802675212168671169_0810285092_init();
    work_m_06211433590118032167_3848980733_init();
    work_m_06013316643538185299_1756712915_init();
    work_m_09710781983910328889_3507859621_init();
    work_m_14636688419537225741_2650790113_init();
    work_m_08430400330746847533_4012206730_init();
    work_m_16541823861846354283_2073120511_init();
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    unisim_p_0947159679_init();
    vl_p_2533777724_init();
    std_textio_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_0229312917_2959432447_init();
    xilinxcorelib_a_3989267687_1709443946_init();
    xilinxcorelib_a_2247161354_0543512595_init();
    xilinxcorelib_a_1002434412_3212880686_init();
    work_a_2681158754_3494191449_init();
    work_a_3411936305_3212880686_init();
    work_a_0537507705_3212880686_init();
    work_a_2789343399_3523452672_init();
    work_a_1388077616_3212880686_init();
    work_a_0428116924_3212880686_init();
    unisim_a_2211589156_2274105955_init();
    work_a_3225011129_3212880686_init();
    work_a_1218885526_3212880686_init();


    xsi_register_tops("work_m_08430400330746847533_4012206730");
    xsi_register_tops("work_m_16541823861846354283_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    VL_P_2533777724 = xsi_get_engine_memory("vl_p_2533777724");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}

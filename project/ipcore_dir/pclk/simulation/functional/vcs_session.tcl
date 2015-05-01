gui_open_window Wave
gui_sg_create pclk_group
gui_list_add_group -id Wave.1 {pclk_group}
gui_sg_addsignal -group pclk_group {pclk_tb.test_phase}
gui_set_radix -radix {ascii} -signals {pclk_tb.test_phase}
gui_sg_addsignal -group pclk_group {{Input_clocks}} -divider
gui_sg_addsignal -group pclk_group {pclk_tb.CLK_IN1}
gui_sg_addsignal -group pclk_group {{Output_clocks}} -divider
gui_sg_addsignal -group pclk_group {pclk_tb.dut.clk}
gui_list_expand -id Wave.1 pclk_tb.dut.clk
gui_sg_addsignal -group pclk_group {{Status_control}} -divider
gui_sg_addsignal -group pclk_group {pclk_tb.RESET}
gui_sg_addsignal -group pclk_group {pclk_tb.LOCKED}
gui_sg_addsignal -group pclk_group {{Counters}} -divider
gui_sg_addsignal -group pclk_group {pclk_tb.COUNT}
gui_sg_addsignal -group pclk_group {pclk_tb.dut.counter}
gui_list_expand -id Wave.1 pclk_tb.dut.counter
gui_zoom -window Wave.1 -full

onerror {quit -f}
vlib work
vlog -work work fsm.vo
vlog -work work fsm.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.fsm_vlg_vec_tst
vcd file -direction fsm.msim.vcd
vcd add -internal fsm_vlg_vec_tst/*
vcd add -internal fsm_vlg_vec_tst/i1/*
add wave /*
run -all

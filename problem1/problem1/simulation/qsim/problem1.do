onerror {quit -f}
vlib work
vlog -work work problem1.vo
vlog -work work problem1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.problem1_vlg_vec_tst
vcd file -direction problem1.msim.vcd
vcd add -internal problem1_vlg_vec_tst/*
vcd add -internal problem1_vlg_vec_tst/i1/*
add wave /*
run -all

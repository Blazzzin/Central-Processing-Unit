onerror {quit -f}
vlib work
vlog -work work problem2.vo
vlog -work work problem2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.problem2_vlg_vec_tst
vcd file -direction problem2.msim.vcd
vcd add -internal problem2_vlg_vec_tst/*
vcd add -internal problem2_vlg_vec_tst/i1/*
add wave /*
run -all

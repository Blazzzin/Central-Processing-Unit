onerror {quit -f}
vlib work
vlog -work work problem3.vo
vlog -work work problem3.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.problem3_vlg_vec_tst
vcd file -direction problem3.msim.vcd
vcd add -internal problem3_vlg_vec_tst/*
vcd add -internal problem3_vlg_vec_tst/i1/*
add wave /*
run -all

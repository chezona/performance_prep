onerror {resume}
quietly WaveActivateNextPane {} 0
<<<<<<< HEAD
add wave -noupdate /execute_tb/eif/bfu_branch
add wave -noupdate /execute_tb/eif/bfu_branch_gate_sel
add wave -noupdate /execute_tb/eif/bfu_branch_outcome
add wave -noupdate /execute_tb/eif/bfu_predicted_outcome
add wave -noupdate /execute_tb/eif/bfu_misprediction
add wave -noupdate /execute_tb/eif/bfu_update_btb
add wave -noupdate /execute_tb/eif/bfu_branch_type
add wave -noupdate /execute_tb/eif/bfu_reg_a
add wave -noupdate /execute_tb/eif/bfu_reg_b
add wave -noupdate /execute_tb/eif/bfu_current_pc
add wave -noupdate /execute_tb/eif/bfu_imm
add wave -noupdate /execute_tb/eif/bfu_updated_pc
add wave -noupdate /execute_tb/eif/bfu_correct_pc
add wave -noupdate /execute_tb/eif/bfu_update_pc
add wave -noupdate /execute_tb/eif/bfu_branch_target
add wave -noupdate /execute_tb/eif/salu_port_a
add wave -noupdate /execute_tb/eif/salu_port_b
add wave -noupdate /execute_tb/eif/salu_aluop
add wave -noupdate /execute_tb/eif/sls_imm
add wave -noupdate /execute_tb/eif/sls_rs1
add wave -noupdate /execute_tb/eif/sls_rs2
add wave -noupdate /execute_tb/eif/sls_dmem_in
add wave -noupdate /execute_tb/eif/sls_dhit_in
add wave -noupdate /execute_tb/eif/sls_mem_type
add wave -noupdate /execute_tb/eif/mls_mhit
add wave -noupdate /execute_tb/eif/mls_enable
add wave -noupdate /execute_tb/eif/mls_ls_in
add wave -noupdate /execute_tb/eif/mls_rd_in
add wave -noupdate /execute_tb/eif/mls_rs_in
add wave -noupdate /execute_tb/eif/mls_imm_in
add wave -noupdate /execute_tb/eif/mls_stride_in
add wave -noupdate /execute_tb/eif/gemm_enable
add wave -noupdate /execute_tb/eif/gemm_new_weight_in
add wave -noupdate /execute_tb/eif/gemm_rs1_in
add wave -noupdate /execute_tb/eif/gemm_rs2_in
add wave -noupdate /execute_tb/eif/gemm_rs3_in
add wave -noupdate /execute_tb/eif/gemm_rd_in
add wave -noupdate /execute_tb/eif/eif_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {229080 ps} 0}
=======
add wave -noupdate /execute_tb/PROG/#ublk#502948#92/tb_test_case
add wave -noupdate -expand -group {Matrix LS} /execute_tb/DUT/mlsif/mhit
add wave -noupdate -expand -group {Matrix LS} /execute_tb/DUT/mlsif/enable
add wave -noupdate -expand -group {Matrix LS} /execute_tb/DUT/mlsif/ls_in
add wave -noupdate -expand -group {Matrix LS} -radix unsigned /execute_tb/DUT/mlsif/rd_in
add wave -noupdate -expand -group {Matrix LS} -radix decimal /execute_tb/DUT/mlsif/rs_in
add wave -noupdate -expand -group {Matrix LS} -radix decimal /execute_tb/DUT/mlsif/imm_in
add wave -noupdate -expand -group {Matrix LS} -radix decimal /execute_tb/DUT/mlsif/stride_in
add wave -noupdate -expand -group {Matrix LS} -childformat {{/execute_tb/DUT/mlsif/fu_matls_out.rd_out -radix unsigned} {/execute_tb/DUT/mlsif/fu_matls_out.address -radix decimal} {/execute_tb/DUT/mlsif/fu_matls_out.stride_out -radix decimal}} -expand -subitemconfig {/execute_tb/DUT/mlsif/fu_matls_out.rd_out {-radix unsigned} /execute_tb/DUT/mlsif/fu_matls_out.address {-radix decimal} /execute_tb/DUT/mlsif/fu_matls_out.stride_out {-radix decimal}} /execute_tb/DUT/mlsif/fu_matls_out
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/enable
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/branch
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/branch_outcome
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/predicted_outcome
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/misprediction
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/update_btb
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/resolved
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/branch_type
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/reg_a
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/reg_b
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/current_pc
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/imm
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/updated_pc
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/correct_pc
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/update_pc
add wave -noupdate -expand -group Branch /execute_tb/DUT/fubif/branch_target
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/negative
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/overflow
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/zero
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/enable
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/aluop
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/port_a
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/port_b
add wave -noupdate -expand -group ALU /execute_tb/DUT/aluif/port_output
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/imm
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/dmemload
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/dmemaddr
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/dmem_in
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/dmemstore
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/rs1
add wave -noupdate -expand -group {Scalar LS} -radix decimal /execute_tb/DUT/slsif/rs2
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/mem_type
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/dmemWEN
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/dmemREN
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/dhit_in
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/enable
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/rd_in
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/rd
add wave -noupdate -expand -group {Scalar LS} /execute_tb/DUT/slsif/dhit
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/gemm_enable
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/new_weight_in
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/rs1_in
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/rs2_in
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/rs3_in
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/rd_in
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/new_weight_out
add wave -noupdate -expand -group GEMM /execute_tb/DUT/fugif/gemm_matrix_num
add wave -noupdate -expand -subitemconfig {/execute_tb/DUT/eif/eif_output.fu_ex -expand} /execute_tb/DUT/eif/eif_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {524130 ps} 0}
>>>>>>> a6b10951552d9fd3d930dad76289145c4f071981
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
<<<<<<< HEAD
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {229010 ps}
=======
configure wave -timelineunits ps
update
WaveRestoreZoom {1510 ps} {636760 ps}
>>>>>>> a6b10951552d9fd3d930dad76289145c4f071981

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sc_datapath_tb/CLK
add wave -noupdate /sc_datapath_tb/nrst
add wave -noupdate /sc_datapath_tb/PROG/tb_test_case
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/halt
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/ihit
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/imemREN
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/imemload
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/imemaddr
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/dhit
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/dmemREN
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/dmemWEN
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/dmemload
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/dmemstore
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/dmemaddr
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/mhit
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/matrix_ls
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/gemm_new_weight
add wave -noupdate -expand -group dcif /sc_datapath_tb/DUT/dcif/gemm_matrices
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/imemREN
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/imemload
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/imemaddr
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/update_btb
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/branch_outcome
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/predicted_outcome
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/update_pc
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/branch_target
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/freeze
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/jump
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/misprediction
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/correct_pc
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/pc
add wave -noupdate -expand -group FETCH -expand -group fsif /sc_datapath_tb/DUT/FETCH/fsif/instr
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/prev_instr
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/prev_pc
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/prev_pred
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/freeze
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/misprediction
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/imemREN
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/imemload
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/pc_prediction
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/instr
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/pc
add wave -noupdate -expand -group FETCH /sc_datapath_tb/DUT/FETCH/fif/correct_pc
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/DI/WAW
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/DI/s_busy
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/DI/m_busy
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/DI/hazard
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/IS/n_rdy
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/DI/RSTS/status
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/IS/next_ready
add wave -noupdate -expand -group SB -expand -subitemconfig {/sc_datapath_tb/DUT/SCOREBOARD/diif/fust_s.op -expand} /sc_datapath_tb/DUT/SCOREBOARD/diif/fust_s
add wave -noupdate -expand -group SB -expand /sc_datapath_tb/DUT/SCOREBOARD/sbif/fetch
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/sbif/wb_issue
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/sbif/wb_dispatch
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/sbif/branch_miss
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/sbif/branch_resolved
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/sbif/fu_ex
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/sbif/freeze
add wave -noupdate -expand -group SB -expand /sc_datapath_tb/DUT/SCOREBOARD/IS/fust_state
add wave -noupdate -expand -group SB /sc_datapath_tb/DUT/SCOREBOARD/IS/incoming_instr
add wave -noupdate -expand -group SB -expand /sc_datapath_tb/DUT/SCOREBOARD/isif/dispatch
add wave -noupdate -expand -group SB -childformat {{/sc_datapath_tb/DUT/SCOREBOARD/sbif/out.rd -radix unsigned} {/sc_datapath_tb/DUT/SCOREBOARD/sbif/out.rdat1 -radix decimal} {/sc_datapath_tb/DUT/SCOREBOARD/sbif/out.rdat2 -radix decimal} {/sc_datapath_tb/DUT/SCOREBOARD/sbif/out.imm -radix unsigned}} -expand -subitemconfig {/sc_datapath_tb/DUT/SCOREBOARD/sbif/out.fu_en -expand /sc_datapath_tb/DUT/SCOREBOARD/sbif/out.rd {-height 16 -radix unsigned} /sc_datapath_tb/DUT/SCOREBOARD/sbif/out.rdat1 {-height 16 -radix decimal} /sc_datapath_tb/DUT/SCOREBOARD/sbif/out.rdat2 {-height 16 -radix decimal} /sc_datapath_tb/DUT/SCOREBOARD/sbif/out.imm {-height 16 -radix unsigned}} /sc_datapath_tb/DUT/SCOREBOARD/sbif/out
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_enable
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_predicted_outcome
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_branch_type
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_reg_a
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_reg_b
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_current_pc
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/bfu_imm
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/salu_port_a
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/salu_port_b
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/salu_aluop
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/salu_enable
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_imm
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_rs1
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_rs2
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_dmem_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_dhit_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_enable
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/sls_mem_type
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/mls_mhit
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/mls_enable
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/mls_ls_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/mls_rd_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/mls_rs_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/mls_imm_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/gemm_enable
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/gemm_new_weight_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/gemm_rs1_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/gemm_rs2_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/gemm_rs3_in
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/gemm_rd_in
add wave -noupdate -expand -group EX -childformat {{/sc_datapath_tb/DUT/EXECUTE/eif/eif_output.jump_rd -radix unsigned}} -expand -subitemconfig {/sc_datapath_tb/DUT/EXECUTE/eif/eif_output.jump_rd {-height 16 -radix unsigned}} /sc_datapath_tb/DUT/EXECUTE/eif/eif_output
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/halt
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/spec
add wave -noupdate -expand -group EX /sc_datapath_tb/DUT/EXECUTE/eif/rd
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/alu_wdat
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/wbif/jump_done
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/wbif/jump_reg_sel
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/wbif/jump_wdat
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/load_wdat
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/branch_mispredict
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/branch_spec
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/branch_correct
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/alu_done
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/load_done
add wave -noupdate -expand -group WB -radix unsigned /sc_datapath_tb/DUT/WRITEBACK/wbif/alu_reg_sel
add wave -noupdate -expand -group WB /sc_datapath_tb/DUT/WRITEBACK/wbif/load_reg_sel
add wave -noupdate -expand -group WB -childformat {{/sc_datapath_tb/DUT/WRITEBACK/wbif/wb_out.reg_sel -radix unsigned}} -subitemconfig {/sc_datapath_tb/DUT/WRITEBACK/wbif/wb_out.reg_sel {-height 16 -radix unsigned}} /sc_datapath_tb/DUT/WRITEBACK/wbif/wb_out
add wave -noupdate -childformat {{{/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0]} -radix hexadecimal -childformat {{{[37]} -radix hexadecimal} {{[36]} -radix hexadecimal} {{[35]} -radix hexadecimal} {{[34]} -radix hexadecimal} {{[33]} -radix hexadecimal} {{[32]} -radix hexadecimal} {{[31]} -radix hexadecimal} {{[30]} -radix hexadecimal} {{[29]} -radix hexadecimal} {{[28]} -radix hexadecimal} {{[27]} -radix hexadecimal} {{[26]} -radix hexadecimal} {{[25]} -radix hexadecimal} {{[24]} -radix hexadecimal} {{[23]} -radix hexadecimal} {{[22]} -radix hexadecimal} {{[21]} -radix hexadecimal} {{[20]} -radix hexadecimal} {{[19]} -radix hexadecimal} {{[18]} -radix hexadecimal} {{[17]} -radix hexadecimal} {{[16]} -radix hexadecimal} {{[15]} -radix hexadecimal} {{[14]} -radix hexadecimal} {{[13]} -radix hexadecimal} {{[12]} -radix hexadecimal} {{[11]} -radix hexadecimal} {{[10]} -radix hexadecimal} {{[9]} -radix hexadecimal} {{[8]} -radix hexadecimal} {{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}}} -subitemconfig {{/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0]} {-height 16 -radix hexadecimal -childformat {{{[37]} -radix hexadecimal} {{[36]} -radix hexadecimal} {{[35]} -radix hexadecimal} {{[34]} -radix hexadecimal} {{[33]} -radix hexadecimal} {{[32]} -radix hexadecimal} {{[31]} -radix hexadecimal} {{[30]} -radix hexadecimal} {{[29]} -radix hexadecimal} {{[28]} -radix hexadecimal} {{[27]} -radix hexadecimal} {{[26]} -radix hexadecimal} {{[25]} -radix hexadecimal} {{[24]} -radix hexadecimal} {{[23]} -radix hexadecimal} {{[22]} -radix hexadecimal} {{[21]} -radix hexadecimal} {{[20]} -radix hexadecimal} {{[19]} -radix hexadecimal} {{[18]} -radix hexadecimal} {{[17]} -radix hexadecimal} {{[16]} -radix hexadecimal} {{[15]} -radix hexadecimal} {{[14]} -radix hexadecimal} {{[13]} -radix hexadecimal} {{[12]} -radix hexadecimal} {{[11]} -radix hexadecimal} {{[10]} -radix hexadecimal} {{[9]} -radix hexadecimal} {{[8]} -radix hexadecimal} {{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][37]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][36]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][35]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][34]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][33]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][32]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][31]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][30]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][29]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][28]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][27]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][26]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][25]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][24]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][23]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][22]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][21]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][20]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][19]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][18]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][17]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][16]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][15]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][14]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][13]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][12]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][11]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][10]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][9]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][8]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][7]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][6]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][5]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][4]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][3]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][2]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][1]} {-radix hexadecimal} {/sc_datapath_tb/DUT/WRITEBACK/alu_buffer[0][0]} {-radix hexadecimal}} /sc_datapath_tb/DUT/WRITEBACK/alu_buffer
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/alu_full
add wave -noupdate -childformat {{/sc_datapath_tb/DUT/WRITEBACK/alu_din.reg_sel -radix unsigned}} -expand -subitemconfig {/sc_datapath_tb/DUT/WRITEBACK/alu_din.reg_sel {-height 16 -radix unsigned}} /sc_datapath_tb/DUT/WRITEBACK/alu_din
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/alu_empty
add wave -noupdate -childformat {{/sc_datapath_tb/DUT/WRITEBACK/load_din.reg_sel -radix unsigned} {/sc_datapath_tb/DUT/WRITEBACK/load_din.wdat -radix unsigned}} -expand -subitemconfig {/sc_datapath_tb/DUT/WRITEBACK/load_din.reg_sel {-height 16 -radix unsigned} /sc_datapath_tb/DUT/WRITEBACK/load_din.wdat {-height 16 -radix unsigned}} /sc_datapath_tb/DUT/WRITEBACK/load_din
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_dout
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_write
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_read
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_wptr
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_rptr
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/next_load_wptr
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/next_load_rptr
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_count
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/next_load_count
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_buffer
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/next_load_buffer
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_empty
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/load_full
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/wb_sel
add wave -noupdate /sc_datapath_tb/DUT/WRITEBACK/state
add wave -noupdate -expand -group register /sc_datapath_tb/DUT/SCOREBOARD/IS/RF/CLK
add wave -noupdate -expand -group register /sc_datapath_tb/DUT/SCOREBOARD/IS/RF/nRST
add wave -noupdate -expand -group register -expand /sc_datapath_tb/DUT/SCOREBOARD/IS/RF/register
add wave -noupdate -expand -group register /sc_datapath_tb/DUT/SCOREBOARD/IS/RF/next_reg
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/negative
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/overflow
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/zero
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/enable
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/aluop
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/port_a
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/port_b
add wave -noupdate -expand -group ALU /sc_datapath_tb/DUT/EXECUTE/SALU/aluif/port_output
add wave -noupdate /sc_datapath_tb/DUT/SCOREBOARD/diif/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {485220 ps} 1} {{Cursor 2} {825410 ps} 1} {{Cursor 3} {791360 ps} 0}
quietly wave cursor active 3
configure wave -namecolwidth 157
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
configure wave -timelineunits ps
update
WaveRestoreZoom {649730 ps} {1207910 ps}

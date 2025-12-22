onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fetch_stage_tb/tb_test_case
add wave -noupdate /fetch_stage_tb/tb_clk
add wave -noupdate /fetch_stage_tb/tb_nrst
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/imemload
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/update_btb
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/branch_outcome
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/update_pc
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/branch_target
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/freeze
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/misprediction
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/correct_pc
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/pc
add wave -noupdate -expand -group FSIF /fetch_stage_tb/fsif/instr
add wave -noupdate /fetch_stage_tb/fsif/predicted_outcome
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {16 ns}

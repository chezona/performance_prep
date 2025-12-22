onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fu_scalar_ls_tb/CLK
add wave -noupdate /fu_scalar_ls_tb/nRST
add wave -noupdate -expand -group In /fu_scalar_ls_tb/slsif/enable
add wave -noupdate -expand -group In -radix decimal /fu_scalar_ls_tb/slsif/imm
add wave -noupdate -expand -group In /fu_scalar_ls_tb/slsif/mem_type
add wave -noupdate -expand -group In -radix decimal /fu_scalar_ls_tb/slsif/rs1
add wave -noupdate -expand -group In -radix decimal /fu_scalar_ls_tb/slsif/rs2
add wave -noupdate -expand -group In -radix decimal /fu_scalar_ls_tb/slsif/dmem_in
add wave -noupdate -expand -group In /fu_scalar_ls_tb/slsif/dhit_in
add wave -noupdate -expand -group In /fu_scalar_ls_tb/slsif/rd_in
add wave -noupdate -expand -group Out -radix decimal /fu_scalar_ls_tb/slsif/dmemaddr
add wave -noupdate -expand -group Out /fu_scalar_ls_tb/slsif/dmemWEN
add wave -noupdate -expand -group Out /fu_scalar_ls_tb/slsif/dmemREN
add wave -noupdate -expand -group Out -radix decimal /fu_scalar_ls_tb/slsif/dmemstore
add wave -noupdate -expand -group Out /fu_scalar_ls_tb/slsif/dhit
add wave -noupdate -expand -group Out -radix decimal /fu_scalar_ls_tb/slsif/dmemload
add wave -noupdate -expand -group Out -radix decimal /fu_scalar_ls_tb/slsif/rd
add wave -noupdate -expand -group Internal /fu_scalar_ls_tb/DUT/state
add wave -noupdate -expand -group Internal /fu_scalar_ls_tb/DUT/latched_dmemREN
add wave -noupdate -expand -group Internal /fu_scalar_ls_tb/DUT/next_dmemREN
add wave -noupdate -expand -group Internal /fu_scalar_ls_tb/DUT/latched_dmemWEN
add wave -noupdate -expand -group Internal /fu_scalar_ls_tb/DUT/next_dmemWEN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {152150 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {80600 ps} {241870 ps}

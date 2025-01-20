# Clock Signal
set_property PACKAGE_PIN W5 [get_ports {clock}];
set_property IOSTANDARD LVCMOS33 [get_ports {clock}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clock}];

# Switches (Sensors and Mode Select)
set_property PACKAGE_PIN V17 [get_ports {mode_select}];
set_property IOSTANDARD LVCMOS33 [get_ports {mode_select}];
set_property PACKAGE_PIN W16 [get_ports {motion_sensor}];
set_property IOSTANDARD LVCMOS33 [get_ports {motion_sensor}];
set_property PACKAGE_PIN W17 [get_ports {smoke_sensor}];
set_property IOSTANDARD LVCMOS33 [get_ports {smoke_sensor}];
set_property PACKAGE_PIN W15 [get_ports {gas_leak_sensor}];
set_property IOSTANDARD LVCMOS33 [get_ports {gas_leak_sensor}];
set_property PACKAGE_PIN V15 [get_ports {door_sensor}];
set_property IOSTANDARD LVCMOS33 [get_ports {door_sensor}];
set_property PACKAGE_PIN V2 [get_ports {temperature_sensor_high}];
set_property IOSTANDARD LVCMOS33 [get_ports {temperature_sensor_high}];
set_property PACKAGE_PIN T3 [get_ports {temperature_sensor_low}];
set_property IOSTANDARD LVCMOS33 [get_ports {temperature_sensor_low}];

# Buttons (Manual Controls)
set_property PACKAGE_PIN U18 [get_ports {manual_light_control}];
set_property IOSTANDARD LVCMOS33 [get_ports {manual_light_control}];
set_property PACKAGE_PIN T18 [get_ports {manual_fan_control}];
set_property IOSTANDARD LVCMOS33 [get_ports {manual_fan_control}];
set_property PACKAGE_PIN W19 [get_ports {manual_ac_control}];
set_property IOSTANDARD LVCMOS33 [get_ports {manual_ac_control}];
set_property PACKAGE_PIN T17 [get_ports {manual_heating_control}];
set_property IOSTANDARD LVCMOS33 [get_ports {manual_heating_control}];
set_property PACKAGE_PIN U17 [get_ports {manual_cooling_control}];
set_property IOSTANDARD LVCMOS33 [get_ports {manual_cooling_control}];

# LEDs (Outputs)
set_property PACKAGE_PIN U16 [get_ports {light_output}];
set_property IOSTANDARD LVCMOS33 [get_ports {light_output}];
set_property PACKAGE_PIN E19 [get_ports {fan_output}];
set_property IOSTANDARD LVCMOS33 [get_ports {fan_output}];
set_property PACKAGE_PIN U19 [get_ports {ac_output}];
set_property IOSTANDARD LVCMOS33 [get_ports {ac_output}];
set_property PACKAGE_PIN V19 [get_ports {alarm_output}];
set_property IOSTANDARD LVCMOS33 [get_ports {alarm_output}];
set_property PACKAGE_PIN W18 [get_ports {emergency_shutdown}];
set_property IOSTANDARD LVCMOS33 [get_ports {emergency_shutdown}];
set_property PACKAGE_PIN U15 [get_ports {heating_system_output}];
set_property IOSTANDARD LVCMOS33 [get_ports {heating_system_output}];
set_property PACKAGE_PIN U14 [get_ports {cooling_system_output}];
set_property IOSTANDARD LVCMOS33 [get_ports {cooling_system_output}];

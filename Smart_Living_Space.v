`timescale 1ns / 1ps

module Smart_Living_Space(
    input wire clock,                   // Clock signal
    input wire mode_select,             // Switch for mode selection (manual/auto)
    input wire motion_sensor,           // Switch representing motion sensor input
    input wire smoke_sensor,            // Switch representing smoke sensor input
    input wire gas_leak_sensor,         // Switch representing gas leak sensor input
    input wire door_sensor,             // Switch representing door sensor input
    input wire temperature_sensor_high, // Switch for high temperature input
    input wire temperature_sensor_low,  // Switch for low temperature input
    input wire manual_light_control,    // Button for manual light control
    input wire manual_fan_control,      // Button for manual fan control
    input wire manual_ac_control,       // Button for manual AC control
    input wire manual_heating_control,  // Button for manual heating control
    input wire manual_cooling_control,  // Button for manual cooling control
    output reg light_output,            // LED for light control output
    output reg fan_output,              // LED for fan control output
    output reg ac_output,               // LED for AC control output
    output reg alarm_output,            // LED for alarm control (smoke/gas leak)
    output reg emergency_shutdown,      // LED for emergency shutdown
    output reg heating_system_output,   // LED for heating system control
    output reg cooling_system_output    // LED for cooling system control
);

    // Mode select states (Auto = 0, Manual = 1)
    localparam AUTO_MODE = 1'b0;
    localparam MANUAL_MODE = 1'b1;

    // Registers for internal state tracking
    reg [1:0] heating_status;          // 00: Off, 01: Low Heating, 10: High Heating
    reg [1:0] cooling_status;          // 00: Off, 01: Low Cooling, 10: High Cooling

    // Automatic mode logic
    always @(posedge clock) begin
        if (mode_select == AUTO_MODE) begin
            // AUTOMATIC MODE
            // Light control logic
            if (motion_sensor || door_sensor) 
                light_output <= 1'b1;  // Turn on the light if motion or door detected
            else 
                light_output <= 1'b0;  // Turn off the light otherwise
            
            // Fan control logic
            if (motion_sensor) 
                fan_output <= 1'b1;    // Turn on the fan when motion detected
            else 
                fan_output <= 1'b0;    // Turn off the fan otherwise

            // AC control logic
            if (motion_sensor) 
                ac_output <= 1'b1;     // Turn on AC during motion
            else 
                ac_output <= 1'b0;     // Turn off AC when no motion

            // Alarm control based on smoke and gas leak sensors
            if (smoke_sensor || gas_leak_sensor)
                alarm_output <= 1'b1;  // Activate alarm if smoke or gas is detected
            else
                alarm_output <= 1'b0;  // Deactivate alarm if no hazard detected

            // Emergency shutdown logic
            if (smoke_sensor || gas_leak_sensor)
                emergency_shutdown <= 1'b1;  // Trigger emergency shutdown
            else
                emergency_shutdown <= 1'b0;  // Clear emergency state
            
            // Heating system logic
            if (temperature_sensor_low) begin
                heating_status <= 2'b01;     // Low heating when temperature is low
                heating_system_output <= 1'b1;
            end 
            else begin
                heating_status <= 2'b00;     // Turn off heating if not required
                heating_system_output <= 1'b0;
            end

            // Cooling system logic
            if (temperature_sensor_high) begin
                cooling_status <= 2'b10;     // High cooling for high temperature
                cooling_system_output <= 1'b1;
            end 
            else begin
                cooling_status <= 2'b00;     // Turn off cooling if not required
                cooling_system_output <= 1'b0;
            end
        end 
        else if (mode_select == MANUAL_MODE) begin
            // MANUAL MODE
            // Manual light control
            light_output <= manual_light_control;

            // Manual fan control
            fan_output <= manual_fan_control;

            // Manual AC control
            ac_output <= manual_ac_control;

            // Manual heating system control
            if (manual_heating_control) begin
                heating_status <= 2'b01;    // Low heating in manual mode
                heating_system_output <= 1'b1;
            end 
            else begin
                heating_status <= 2'b00;    // Turn off heating manually
                heating_system_output <= 1'b0;
            end

            // Manual cooling system control
            if (manual_cooling_control) begin
                cooling_status <= 2'b01;    // Low cooling in manual mode
                cooling_system_output <= 1'b1;
            end 
            else begin
                cooling_status <= 2'b00;    // Turn off cooling manually
                cooling_system_output <= 1'b0;
            end

            // Alarm and emergency shutdown are handled automatically even in manual mode
            if (smoke_sensor || gas_leak_sensor) begin
                alarm_output <= 1'b1;
                emergency_shutdown <= 1'b1;
            end 
            else begin
                alarm_output <= 1'b0;
                emergency_shutdown <= 1'b0;
            end
        end
    end
endmodule
-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "09/05/2018 11:07:05"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          tx_serial_base
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tx_serial_base_vhd_vec_tst IS
END tx_serial_base_vhd_vec_tst;
ARCHITECTURE tx_serial_base_arch OF tx_serial_base_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL dados_ascii : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL paridade : STD_LOGIC;
SIGNAL partida : STD_LOGIC;
SIGNAL pronto : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL saida_serial : STD_LOGIC;
COMPONENT tx_serial_base
	PORT (
	clock : IN STD_LOGIC;
	dados_ascii : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	paridade : IN STD_LOGIC;
	partida : IN STD_LOGIC;
	pronto : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	saida_serial : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : tx_serial_base
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	dados_ascii => dados_ascii,
	paridade => paridade,
	partida => partida,
	pronto => pronto,
	reset => reset,
	saida_serial => saida_serial
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
	clock <= '0';
WAIT;
END PROCESS t_prcs_clock;
-- dados_ascii[6]
t_prcs_dados_ascii_6: PROCESS
BEGIN
	dados_ascii(6) <= '1';
WAIT;
END PROCESS t_prcs_dados_ascii_6;
-- dados_ascii[5]
t_prcs_dados_ascii_5: PROCESS
BEGIN
	dados_ascii(5) <= '0';
WAIT;
END PROCESS t_prcs_dados_ascii_5;
-- dados_ascii[4]
t_prcs_dados_ascii_4: PROCESS
BEGIN
	dados_ascii(4) <= '1';
WAIT;
END PROCESS t_prcs_dados_ascii_4;
-- dados_ascii[3]
t_prcs_dados_ascii_3: PROCESS
BEGIN
	dados_ascii(3) <= '1';
WAIT;
END PROCESS t_prcs_dados_ascii_3;
-- dados_ascii[2]
t_prcs_dados_ascii_2: PROCESS
BEGIN
	dados_ascii(2) <= '0';
WAIT;
END PROCESS t_prcs_dados_ascii_2;
-- dados_ascii[1]
t_prcs_dados_ascii_1: PROCESS
BEGIN
	dados_ascii(1) <= '0';
WAIT;
END PROCESS t_prcs_dados_ascii_1;
-- dados_ascii[0]
t_prcs_dados_ascii_0: PROCESS
BEGIN
	dados_ascii(0) <= '0';
WAIT;
END PROCESS t_prcs_dados_ascii_0;

-- paridade
t_prcs_paridade: PROCESS
BEGIN
	paridade <= '0';
WAIT;
END PROCESS t_prcs_paridade;

-- partida
t_prcs_partida: PROCESS
BEGIN
	partida <= '0';
WAIT;
END PROCESS t_prcs_partida;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END tx_serial_base_arch;

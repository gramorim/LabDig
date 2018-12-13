-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/13/2018 13:43:32"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          mensagem
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mensagem_vhd_vec_tst IS
END mensagem_vhd_vec_tst;
ARCHITECTURE mensagem_arch OF mensagem_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL db_ascii : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL db_ascii_dec : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL db_ascii_jogada : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL db_enable : STD_LOGIC;
SIGNAL db_estado : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL db_Q : STD_LOGIC;
SIGNAL db_tick : STD_LOGIC;
SIGNAL enviar : STD_LOGIC;
SIGNAL i_mensagem : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL jogada : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL pronto : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL saida_serial : STD_LOGIC;
COMPONENT mensagem
	PORT (
	clock : IN STD_LOGIC;
	db_ascii : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	db_ascii_dec : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	db_ascii_jogada : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	db_enable : OUT STD_LOGIC;
	db_estado : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	db_Q : OUT STD_LOGIC;
	db_tick : OUT STD_LOGIC;
	enviar : IN STD_LOGIC;
	i_mensagem : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	jogada : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
	pronto : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	saida_serial : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mensagem
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	db_ascii => db_ascii,
	db_ascii_dec => db_ascii_dec,
	db_ascii_jogada => db_ascii_jogada,
	db_enable => db_enable,
	db_estado => db_estado,
	db_Q => db_Q,
	db_tick => db_tick,
	enviar => enviar,
	i_mensagem => i_mensagem,
	jogada => jogada,
	pronto => pronto,
	reset => reset,
	saida_serial => saida_serial
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 5000 ps;
	clock <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 4000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 30000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- enviar
t_prcs_enviar: PROCESS
BEGIN
	enviar <= '0';
	WAIT FOR 50000 ps;
	enviar <= '1';
	WAIT FOR 20000 ps;
	enviar <= '0';
	WAIT FOR 2050000 ps;
	enviar <= '1';
	WAIT FOR 40000 ps;
	enviar <= '0';
WAIT;
END PROCESS t_prcs_enviar;
-- i_mensagem[2]
t_prcs_i_mensagem_2: PROCESS
BEGIN
	i_mensagem(2) <= '0';
WAIT;
END PROCESS t_prcs_i_mensagem_2;
-- i_mensagem[1]
t_prcs_i_mensagem_1: PROCESS
BEGIN
	i_mensagem(1) <= '0';
	WAIT FOR 2080000 ps;
	i_mensagem(1) <= '1';
	WAIT FOR 120000 ps;
	i_mensagem(1) <= '0';
WAIT;
END PROCESS t_prcs_i_mensagem_1;
-- i_mensagem[0]
t_prcs_i_mensagem_0: PROCESS
BEGIN
	i_mensagem(0) <= '0';
WAIT;
END PROCESS t_prcs_i_mensagem_0;
-- jogada[13]
t_prcs_jogada_13: PROCESS
BEGIN
	jogada(13) <= '1';
WAIT;
END PROCESS t_prcs_jogada_13;
-- jogada[12]
t_prcs_jogada_12: PROCESS
BEGIN
	jogada(12) <= '1';
WAIT;
END PROCESS t_prcs_jogada_12;
-- jogada[11]
t_prcs_jogada_11: PROCESS
BEGIN
	jogada(11) <= '1';
WAIT;
END PROCESS t_prcs_jogada_11;
-- jogada[10]
t_prcs_jogada_10: PROCESS
BEGIN
	jogada(10) <= '1';
WAIT;
END PROCESS t_prcs_jogada_10;
-- jogada[9]
t_prcs_jogada_9: PROCESS
BEGIN
	jogada(9) <= '0';
WAIT;
END PROCESS t_prcs_jogada_9;
-- jogada[8]
t_prcs_jogada_8: PROCESS
BEGIN
	jogada(8) <= '0';
WAIT;
END PROCESS t_prcs_jogada_8;
-- jogada[7]
t_prcs_jogada_7: PROCESS
BEGIN
	jogada(7) <= '0';
WAIT;
END PROCESS t_prcs_jogada_7;
-- jogada[6]
t_prcs_jogada_6: PROCESS
BEGIN
	jogada(6) <= '0';
WAIT;
END PROCESS t_prcs_jogada_6;
-- jogada[5]
t_prcs_jogada_5: PROCESS
BEGIN
	jogada(5) <= '0';
WAIT;
END PROCESS t_prcs_jogada_5;
-- jogada[4]
t_prcs_jogada_4: PROCESS
BEGIN
	jogada(4) <= '0';
WAIT;
END PROCESS t_prcs_jogada_4;
-- jogada[3]
t_prcs_jogada_3: PROCESS
BEGIN
	jogada(3) <= '1';
WAIT;
END PROCESS t_prcs_jogada_3;
-- jogada[2]
t_prcs_jogada_2: PROCESS
BEGIN
	jogada(2) <= '1';
WAIT;
END PROCESS t_prcs_jogada_2;
-- jogada[1]
t_prcs_jogada_1: PROCESS
BEGIN
	jogada(1) <= '1';
WAIT;
END PROCESS t_prcs_jogada_1;
-- jogada[0]
t_prcs_jogada_0: PROCESS
BEGIN
	jogada(0) <= '1';
WAIT;
END PROCESS t_prcs_jogada_0;
END mensagem_arch;

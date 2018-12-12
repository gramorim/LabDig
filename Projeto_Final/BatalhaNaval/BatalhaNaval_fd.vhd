library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.alL;


entity BatalhaNaval_fd is
	port(clock, reset : in std_logic;
			entrada_serial : in std_logic_vector;
			
			enableRecJog, enableEnvMen, enableRecMen, enableOpCam : in std_logic;
			
			end1, end0 : out std_logic_vector(2 DOWNTO 0);
			menRec : out std_logic_vector(6 downto 0);
end BatalhaNaval_fd;

architecture batalha_naval_fd_arc of BatalhaNaval_fd is 

begin

			
end batalha_naval_fd_arc;
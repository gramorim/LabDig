library IEEE;
use IEEE.std_logic_1164.all;

entity mux8x1_n is
  generic (
       constant BITS: integer := 4);
  port(D7, D6, D5, D4, D3, D2, D1, D0 : in std_logic_vector (BITS-1 downto 0);
       SEL: in std_logic_vector (2 downto 0);
       MX_OUT : out std_logic_vector (BITS-1 downto 0));
end mux8x1_n;

-- architecture
architecture arch_mux8x1_n of mux8x1_n is
begin
  MX_OUT <= D7 when (SEL = "111") else
            D6 when (SEL = "110") else
            D5 when (SEL = "101") else
				D4 when (SEL = "100") else
            D3 when (SEL = "011") else
            D2 when (SEL = "010") else
				D1 when (SEL = "001") else
            D0 when (SEL = "000") else
				(others => '1');
end arch_mux8x1_n;
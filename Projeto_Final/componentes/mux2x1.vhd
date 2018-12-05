library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1 is
  generic (
       constant BITS: integer := 4);
  port(D1, D0 : in std_logic_vector (BITS-1 downto 0);
       SEL: in std_logic;
       MX_OUT : out std_logic_vector (BITS-1 downto 0));
end mux2x1;

-- architecture
architecture arch_mux2x1 of mux2x1 is
begin
  MX_OUT <= D1 when (SEL = '1') else
            D0 when (SEL = '0');
end arch_mux2x1;
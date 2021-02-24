----------------------------------------------------------------------------------
--this is Half Adder Module
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder_vhd is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           c : out STD_LOGIC);
end half_adder_vhd;

architecture Behavioral of half_adder_vhd is

begin

s<= a xor b;
c<= a and b;
end Behavioral;

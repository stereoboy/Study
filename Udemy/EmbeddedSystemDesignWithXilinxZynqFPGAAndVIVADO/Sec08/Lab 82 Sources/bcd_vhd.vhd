library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity counter is
port ( 	clk : in std_logic;
	reset : in std_logic;
	pause : in std_logic;
	count_out : out std_logic_vector(3 downto 0));
end counter;
architecture Behavioral of counter is
signal temp_count : std_logic_vector(3 downto 0) := x"0";
signal slow_clk : std_logic;
	-- Clock divider can be changed to suit application.
	-- Clock (clk) is normally 100 MHz, so each clock cycle
	-- is 10 ns. A clock divider of 'n' bits will make 1
	-- slow_clk cycle equal 2^n clk cycles.
signal clk_divider : std_logic_vector(24 downto 0) := "0000000000000000000000000"; --25 binary bit value
begin
-- Process that makes slow clock go high only when MSB of
-- clk_divider goes high.
clk_division : process (clk, clk_divider)


begin
	if (clk = '1' and clk'event) then
	clk_divider <= clk_divider + 1;
end if;
	slow_clk <= clk_divider(24);
end process;
counting : process(reset, pause, slow_clk, temp_count)
begin
	if reset = '1' then
	temp_count <= "0000"; -- Asynchronous reset.
	elsif pause = '1' then
temp_count <= temp_count; -- Asynchronous count pause.
else
if slow_clk'event and slow_clk ='1' then -- Counting state
if temp_count < 9 then
temp_count <= temp_count + 1; -- Counter increase
else
temp_count <= "0000"; -- Rollover to zero
end if;
end if;
end if;
count_out <= temp_count; -- Output
end process;
end Behavioral; -- End module.

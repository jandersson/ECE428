----------------------------------------------------------------------------------
-- Company: 
-- Engineering Student: Jonas Andersson
-- 
-- Create Date:    17:06:12 02/02/2015 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity counter is
port( countup : in std_logic; reset : in std_logic; lights : out std_logic_vector (2 downto 0));
end counter;
architecture Behavioral of counter is
begin
P1 : process (countup, reset)
variable tracker : std_logic_vector (2 downto 0) := "000";
begin
if (reset = '1') then
tracker := "000";
elsif rising_edge (countup) then
case (tracker) is
when "000" => tracker := "001";
when "001" => tracker := "010";
when "010" => tracker := "011";
when "011" => tracker := "100";
when "100" => tracker := "101";
when "101" => tracker := "110";
when "110" => tracker := "111";
when "111" => tracker := "000";
when others => tracker := "000";
end case;
end if;
lights(0) <= tracker(0);
lights(1) <= tracker(1);
lights(2) <= tracker(2);
end process;
end Behavioral;

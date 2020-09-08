----------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: HW0_P1
-- Design Name: BARREL_SHIFT
----------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BARREL_SHIFT is
    Port ( DIN : in STD_LOGIC_VECTOR (15 downto 0);
           SHIFT_AMT : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           ENB : in STD_LOGIC;
           DOUT : out STD_LOGIC_VECTOR (15 downto 0));
end BARREL_SHIFT;

architecture Behavioral of BARREL_SHIFT is
signal DOUT_REG, NEXT_REG: STD_LOGIC_VECTOR (15 downto 0);

begin

--Current State Logic
process(ENB,CLK)
begin
    if(ENB='0') then
        DOUT_REG <= DOUT_REG;
    elsif(rising_edge(CLK)) then
        DOUT_REG <= NEXT_REG;
    end if;
end process;

--Next State Logic 
WITH SHIFT_AMT select
    NEXT_REG <= DIN(0) & DIN(15 downto 1) when "0001",
                DIN(1 downto 0) & DIN(15 downto 2) when "0010",
                DIN(2 downto 0) & DIN(15 downto 3) when "0011",
                DIN(3 downto 0) & DIN(15 downto 4) when "0100",
                DIN(4 downto 0) & DIN(15 downto 5) when "0101",
                DIN(5 downto 0) & DIN(15 downto 6) when "0110",
                DIN(6 downto 0) & DIN(15 downto 7) when "0111",
                DIN(7 downto 0) & DIN(15 downto 8) when "1000",
                DIN(8 downto 0) & DIN(15 downto 9) when "1001",
                DIN(9 downto 0) & DIN(15 downto 10) when "1010",
                DIN(10 downto 0) & DIN(15 downto 11) when "1011",
                DIN(11 downto 0) & DIN(15 downto 12) when "1100",
                DIN(12 downto 0) & DIN(15 downto 13) when "1101",
                DIN(13 downto 0) & DIN(15 downto 14) when "1110",
                DIN(14 downto 0) & DIN(15) when "1111",
                DIN when others;
                
--Output Logic
DOUT <= DOUT_REG;

end Behavioral;

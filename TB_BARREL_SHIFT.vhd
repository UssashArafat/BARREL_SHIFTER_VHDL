----------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: HW0_P1
-- Design Name: TB_BARREL_SHIFT
----------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_BARREL_SHIFT is
--  Port ( );
end TB_BARREL_SHIFT;

architecture Behavioral of TB_BARREL_SHIFT is
component BARREL_SHIFT is
    Port ( DIN : in STD_LOGIC_VECTOR (15 downto 0);
           SHIFT_AMT : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           ENB : in STD_LOGIC;
           DOUT : out STD_LOGIC_VECTOR (15 downto 0));
end component BARREL_SHIFT;

signal DIN, DOUT: STD_LOGIC_VECTOR (15 downto 0);
signal SHIFT_AMT: STD_LOGIC_VECTOR (3 downto 0);
signal ENB,CLK: STD_LOGIC;

begin
UUT: BARREL_SHIFT port map (DIN=>DIN, SHIFT_AMT=>SHIFT_AMT, ENB=>ENB, CLK=>CLK, DOUT=>DOUT);

process
begin
CLK <= '0';
wait for 5ns;
CLK <= '1';
wait for 5ns;
end process;

process
begin
ENB <= '0';
wait for 10 ns;
ENB <= '1';
wait;
end process;

process
begin
DIN <= "0000000000000001";
SHIFT_AMT <= "0001";
wait for 10ns;
DIN <= "1000000000000000";
SHIFT_AMT <= "0011";
wait for 10ns;
DIN <= "0000001000000001";
SHIFT_AMT <= "0100";
wait for 10ns;
DIN <= "0000010000000000";
SHIFT_AMT <= "1000";
wait for 10ns;
DIN <= "0001000000000001";
SHIFT_AMT <= "1001";
wait for 10ns;
DIN <= "0000000000000011";
SHIFT_AMT <= "1101";
wait for 10ns;
DIN <= "0111111111111111";
SHIFT_AMT <= "0101";
DIN <= "0000000000000011";
SHIFT_AMT <= "0000";
wait for 10ns;
SHIFT_AMT <= "0010";
wait for 10ns;
DIN <= "0000000000000101";
SHIFT_AMT <= "1111";
wait;

end process;

end Behavioral;
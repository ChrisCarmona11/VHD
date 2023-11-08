----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2023 17:08:35
-- Design Name: 
-- Module Name: Multi6x7_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multi6x7_tb is
--  Port ( );
end Multi6x7_tb;

architecture Behavioral of Multi6x7_tb is

component multi6x7 is
 GENERIC( COLS: INTEGER:=6;
             ROWS: INTEGER:=7);
    Port ( A : in STD_LOGIC_VECTOR (cols-1 downto 0);
           B : in STD_LOGIC_VECTOR (rows-1 downto 0);
           RESULT : OUT STD_LOGIC_VECTOR (cols+rows-1 downto 0));
end component;
signal s_a: std_logic_vector(5 downto 0);
signal s_b: std_logic_vector(6 downto 0);
signal s_r: std_logic_vector(12 downto 0);

begin

U1: multi6x7 port map (s_a,s_b,s_r);

tb:process
begin
    s_a<= "000001";
    s_b<= "0000001";
    wait for 100ns;
    s_a<= "100001";
    s_b<= "1000011";
    wait for 100ns;
    s_a<= "001001";
    s_b<= "0001011";
    wait for 100ns;
    s_a<= "100001";
    s_b<= "0000011";
    wait for 100ns;
end process;

end Behavioral;
